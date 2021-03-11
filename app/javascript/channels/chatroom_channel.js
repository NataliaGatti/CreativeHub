// import consumer from "./consumer";

// const initChatroomCable = () => {
//   const messagesContainer = document.getElementById('messages');
//   if (messagesContainer) {
//     const id = messagesContainer.dataset.chatroomId;

//     consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
//       received(data) {
//         const userId = document.querySelector("#messages").dataset.userId
//         const message = data[0]
//         const author = data[1]
//         if(userId === author) {
//           messagesContainer.insertAdjacentHTML('beforeend', message)
//         } else {
//           messagesContainer.insertAdjacentHTML('beforeend', message)
//         }
//       },
//     });
//   }
// }

// export { initChatroomCable };

import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data)
      },
    });
  }
}

export { initChatroomCable };