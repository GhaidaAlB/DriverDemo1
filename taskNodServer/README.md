
# DriverDemo1

DriverDemo1 is a simple task management system built with Express and MongoDB. It allows for the creation and management of categories and tasks within those categories. This project utilizes Mongoose for schema definition and database interaction, providing a straightforward way to manage tasks and their categorizations.

## Getting Started

These instructions will get your copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Node.js
- npm (Node Package Manager)
- MongoDB

### Installing

First, clone the repository to your local machine:

```bash
git clone https://github.com/GhaidaAlB/DriverDemo1/tree/main/taskNodServer
```

Navigate into the project directory:

```bash
cd driverdemo1
```

Install the required dependencies:

```bash
npm install
```

### Configuration

Ensure MongoDB is set up and running on your machine. You may need to update the MongoDB connection string in the code to match your MongoDB configuration.

### Running the Application

To start the server, run:

```bash
npm start
```

For development, you can use:

```bash
npm run start:dev
```

This will start the application along with MongoDB using nodemon for hot reloading.

## Usage

The application supports the following operations:

- **Create Category**: POST request to `/categories` with a JSON body containing the title.
- **List Categories**: GET request to `/categories`. Optionally, filter by title using query parameters.
- **Update Category**: PUT request to `/categories/:id` with a JSON body containing the updated title.
- **Delete Category**: DELETE request to `/categories/:id`.

For tasks within a category:

- **Add Task to Category**: POST request to `/categories/:categoryId/tasks` with a JSON body containing the title and description of the task.
- **Tasks are automatically listed with their categories**.

## Built With

- [Express](https://expressjs.com/) - The web framework used
- [Mongoose](https://mongoosejs.com/) - Object Data Modeling (ODM) library for MongoDB and Node.js
- [MongoDB](https://www.mongodb.com/) - The database used

