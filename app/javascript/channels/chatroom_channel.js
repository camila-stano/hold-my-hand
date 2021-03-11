import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        if (data.sender === messagesContainer.dataset.userId) {
          messagesContainer.insertAdjacentHTML('beforeend',
        `<div class="direct-to-right direct-chat mb-2 mr-3">${data.message}</div>`);
        } else {
          messagesContainer.insertAdjacentHTML('beforeend',
          `<div class="direct-to-left direct-chat mb-2 mr-3">${data.message}</div>`);
        }
        console.log(data.message)
      },  
    });
  }
}

export { initChatroomCable };