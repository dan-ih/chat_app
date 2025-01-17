const WebSocket = require('ws');

// The WebSocket server address
const wsServer = 'ws://localhost:8080/cable';

// Connect to the WebSocket server
const ws = new WebSocket(wsServer);

ws.on('open', () => {
  console.log('Connected to WebSocket server');

  // Subscribe to the channel
  const subscriptionMessage = JSON.stringify({
    command: 'subscribe',
    identifier: '{"channel":"ChatChannel"}'
  });
  ws.send(subscriptionMessage);
  console.log('Sent subscription request');
  let testnum=1;
  // Start sending messages every second
  const intervalId = setInterval(() => {
    testnum++;
    const message = JSON.stringify({
      command: 'message',
      identifier: '{"channel":"ChatChannel"}',
      data: `{"action":"speak", "message":"Load test - ${testnum}"}`
    });
    ws.send(message);
    console.log('Sent message');
  }, 10);

  // Stop after 10 messages
  setTimeout(() => {
    clearInterval(intervalId);
    ws.close();
  }, 110000);
});

ws.on('message', (data) => {
  console.log('Received:', data.toString());
});

ws.on('close', () => {
  console.log('Connection closed');
});

ws.on('error', (error) => {
  console.error('WebSocket error:', error);
});

