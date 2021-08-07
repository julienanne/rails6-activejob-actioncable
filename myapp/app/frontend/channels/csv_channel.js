import consumer from "./consumer"

consumer.subscriptions.create("CsvChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected action cable channel")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected action cable channel")
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    let p = document.createElement("p");   
    p.textContent = data.body;
    if (data.a != undefined){
      let a = document.createElement("a");
      a.href = data.a;
      a.textContent = "Click here";
      p.append(a);
    }
    document.querySelector("#message").prepend(p);
  }
});
