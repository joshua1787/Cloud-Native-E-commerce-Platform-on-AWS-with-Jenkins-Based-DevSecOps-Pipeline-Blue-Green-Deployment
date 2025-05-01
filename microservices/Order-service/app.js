// app.js - Order Service (simple Express server)
const express = require('express');
const app = express();
const PORT = process.env.PORT || 80;

// Sample data (in a real app, data might come from a database)
const orders = [
  { id: 101, item: "Laptop", quantity: 1 },
  { id: 102, item: "Phone", quantity: 2 }
];

// GET /orders - returns list of orders
app.get('/orders', (req, res) => {
  res.json({ orders });
});

// POST /orders - create a new order (dummy implementation)
app.use(express.json());
app.post('/orders', (req, res) => {
  const newOrder = req.body;
  newOrder.id = Date.now();
  // In a real app, insert the new order into the database
  orders.push(newOrder);
  res.status(201).json({ message: "Order created", order: newOrder });
});

// Health check endpoint
app.get('/health', (req, res) => {
  res.send('Order service is healthy');
});

// Start server
app.listen(PORT, () => {
  console.log(`Order service running on port ${PORT}`);
});
