// app.js - Auth Service (simple Express server)
const express = require('express');
const app = express();
const PORT = process.env.PORT || 80;

// Middleware to parse JSON bodies
app.use(express.json());

// POST /login - authenticate a user (dummy implementation)
app.post('/login', (req, res) => {
  const { username, password } = req.body;
  // Dummy authentication logic
  if(username && password) {
    // In a real app, verify user credentials (e.g., check a database or external auth service)
    return res.json({ token: "fake-jwt-token-for-" + username });
  }
  res.status(400).json({ error: "Missing username or password" });
});

// GET /auth/verify - verify token (dummy implementation)
app.get('/auth/verify', (req, res) => {
  // In a real app, you'd verify JWT or session
  res.json({ status: "ok", user: "demo-user" });
});

// Health check endpoint
app.get('/health', (req, res) => {
  res.send('Auth service is healthy');
});

// Start server
app.listen(PORT, () => {
  console.log(`Auth service running on port ${PORT}`);
});
