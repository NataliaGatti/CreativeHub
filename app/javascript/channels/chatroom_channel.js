import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        const userId = document.querySelector("#messages").dataset.userId
        const domparser = new DOMParser()
        const doc = domparser.parseFromString(data, "text/html")
        if (doc.body.firstChild.dataset.userId === userId) {
          doc.body.firstChild.children[0].classList.add("align-right")
          doc.body.firstChild.children[1].classList.add("other-message")
          doc.body.firstChild.children[1].classList.add("float-right")
        } else {
          doc.body.firstChild.children[1].classList.add("my-message")
        }
        console.log(doc.body.firstChild);
        messagesContainer.insertAdjacentHTML('beforeend', doc.body.firstChild)
      },
    });
  }
}

export { initChatroomCable };