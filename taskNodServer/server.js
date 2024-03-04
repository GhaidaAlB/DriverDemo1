
const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(bodyParser.json());

mongoose.connect('mongodb://localhost:27017/taskManager', {
  useNewUrlParser: true,
  useUnifiedTopology: true
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
  const category = new Category({ title });
  await category.save();
  res.status(201).send(category);
});

app.get('/categories', async (req, res) => {
  const categories = await Category.find().populate('tasks');
  res.send(categories);
});

app.put('/categories/:id', async (req, res) => {
  const { title } = req.body;
  const category = await Category.findByIdAndUpdate(req.params.id, { title }, { new: true });
  res.send(category);
});

app.delete('/categories/:id', async (req, res) => {
  await Category.findByIdAndDelete(req.params.id);
  res.status(204).send();
});

// Routes for Tasks within a Category
app.post('/categories/:categoryId/tasks', async (req, res) => {
  const { title, description } = req.body;
  const task = new Task({ title, description });
  await task.save();
  await Category.findByIdAndUpdate(req.params.categoryId, { $push: { tasks: task._id } });
  res.status(201).send(task);
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
