const express = require('express');
const mongoose = require('mongoose');

const app = express();
const PORT = process.env.PORT || 3003;

app.use(express.json());


mongoose.connect("mongodb+srv://admin:4O8yxD52uy9tAhuB@cluster0.v5puiok.mongodb.net/?retryWrites=true&w=majority")
  .then(() => {
    console.log("Connected to MongoDB");
    app.listen(PORT, () => {
      console.log(`Server is running on port ${PORT}`);
    });
  })
  .catch(err => {
    console.error("Database connection failed", err);
  });

// Task Schema
const taskSchema = new mongoose.Schema({
  title: String,
  description: String,
  createdAt: { type: Date, default: Date.now },
  isCompleted: { type: Boolean, default: false }
});

// Category Schema
const categorySchema = new mongoose.Schema({
  title: String,
  tasks: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Task' }]
});

const Task = mongoose.model('Task', taskSchema);
const Category = mongoose.model('Category', categorySchema);

// Routes for Categories
app.post('/categories', async (req, res) => {
    const { title } = req.body;

    if (!title || title.trim() === '') {
        return res.status(400).send({ message: "Title is required." });
    }

    const category = new Category({ title });
    try {
        await category.save();
        res.status(201).send(category);
    } catch (err) {
        res.status(500).send(err);
    }
});

app.get('/categories', async (req, res) => {
  const title = req.query.title; 
  try {
    let query = {};
    if (title) {

      query.title = title;
    }

    const categories = await Category.find(query)
      .populate('tasks')
      .select('title tasks'); 
    res.send(categories.map(category => ({
      id: category._id, 
        title: category.title,
      
      tasks: category.tasks
    })));
  } catch (err) {
    res.status(500).send(err);
  }
});

app.put('/categories', async (req, res) => {
  const { title ,id} = req.body;
  try {
    const category = await Category.findByIdAndUpdate(id, { title }, { new: true });
    res.send(category);
  } catch (err) {
    res.status(500).send(err);
  }
});

app.delete('/categories', async (req, res) =>
{
    const { id } = req.body;
  try {
    await Category.findByIdAndDelete(id );
    res.status(204).send();
  } catch (err) {
    res.status(500).send(err);
  }
});

// Routes for Tasks within a Category
app.post('/categories/tasks', async (req, res) => {
  const { title, description ,categoryId} = req.body;
  const task = new Task({ title, description });
  try {
    await task.save();
    await Category.findByIdAndUpdate(categoryId, { $push: { tasks: task._id } });
    res.status(201).send(task);
  } catch (err) {
    res.status(500).send(err);
  }
});
