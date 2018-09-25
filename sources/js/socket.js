import {Socket} from "phoenix"

const connect = (tag) => {
  let socket = new Socket("/socket", {params: {token: window.userToken}})

  socket.connect()

  let topic = `giphy:${tag}`;
  console.log("joining topic", topic);

  let channel = socket.channel(topic, {})

  channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) })

  channel.on("image", (payload) => {
    let src = payload.src;
    let img = document.querySelector("img");

    console.log("received new image", src);

    img.setAttribute("src", src)
  })

  return socket;
}

export default connect
