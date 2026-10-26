const http = require('http');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({
    status: 'online',
    language: 'Node.js',
    version: process.version,
    uptime_seconds: Math.floor(process.uptime()),
    timestamp: new Date().toISOString()
  }, null, 2));
});

const PORT = 3000;
server.listen(PORT, '127.0.0.1', () => {
  console.log(`Node.js service running on http://127.0.0.1:${PORT}`);
});
