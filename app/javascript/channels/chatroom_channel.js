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
        const userId = document.querySelector("#message_list").dataset.userId
        const messageData = data[1]
        const author = data[0]

        if(userId == author) {
          const node = `  <li class="clearfix" style="list-style-type: none" data-user-id="${messageData.user_id}">
            <div class="message-data message-container align-right" id="message-${messageData.message_id}">
              <span class="message-data-time" >${messageData.message_created_at}</span> &nbsp; &nbsp;
              <span class="message-data-name" >${messageData.message_user_name}</span> <i class="fa fa-circle me"></i>
            </div>
              
            <div class="message my-message">
              <p>${messageData.message_content}</p>
            </div>
          </li>`

          messagesContainer.insertAdjacentHTML('beforeend', node)
        } else {
          const nodeAux = `  <li class="clearfix" style="list-style-type: none" data-user-id="${messageData.user_id}">
            <div class="message-data message-container" id="message-${messageData.message_id}">
              <span class="message-data-time" >${messageData.message_created_at}</span> &nbsp; &nbsp;
              <span class="message-data-name" >${messageData.message_user_name}</span> <i class="fa fa-circle me"></i>
            </div>
              
            <div class="message other-message">
              <p>${messageData.message_content}</p>
            </div>
          </li>`

          messagesContainer.insertAdjacentHTML('beforeend', nodeAux)
        }
        // console.log(data); // called when data is broadcast in the cable
        // messagesContainer.insertAdjacentHTML('beforeend', data)
        
      },
    });
  }
}

export { initChatroomCable };