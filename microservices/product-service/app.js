// app.js - Product Service (simple Express server)
const express = require('express');
const app = express();
const PORT = process.env.PORT || 80;

// Sample data (in a real app, data would come from a database)
const products = [
  { id: 1, name: "Laptop", price: 1200 },
  { id: 2, name: "Phone", price: 800 }
];

// GET /products - returns list of products
app.get('/products', (req, res) => {
  res.json({ products });
});

// Health check endpoint
app.get('/health', (req, res) => {
  res.send('Product service is healthy');
});

// Start server
app.listen(PORT, () => {
  console.log(`Product service running on port ${PORT}`);
});
