Jiphy sources
=============

Some things needed by Jiphy

* https://developers.giphy.com/dashboard/
* https://developers.giphy.com/explorer/

## Agenda

* Elixir overview
* asdf
* mix phx.new
* Giphy client
* Through the Phoenix pipeline
* Async updates to a local Agent
* Update the view through a channel


## Giphy

Search for a random image:

```
https://api.giphy.com/v1/gifs/random?api_key=#{api_key}&tag=#{tag}&rating=G
```


```html
<script type="text/javascript">
function connect() {
  window.connectToChannel("<%= @tag %>");
}
if (document.readyState === 'complete' || document.readyState !== 'loading') {
  connect()
} else {
  document.addEventListener('DOMContentLoaded', connect);
}
</script>
```