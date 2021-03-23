import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data)
        const dummyDiv = document.createElement('div')
        dummyDiv.innerHTML = data
        const message = dummyDiv.querySelector('.message')
        const currentUser = document.body.dataset.user
        const author = message.dataset.author
        
        if (author === currentUser) {
          message.classList.add('message-me')
        } else {
          message.classList.add('message-you')
        }
        
        messagesContainer.insertAdjacentHTML('beforeend', dummyDiv.innerHTML);

        // #FIXME:
        // console.log(message.id)
        // console.log(document.querySelector(`#${message.id}`))
        // document.querySelector(`#${message.id}`).scrollIntoView()
      },
    });
  }
}

export { initChatroomCable };
