Jiphy sources
=============

Some things needed by Jiphy

* https://developers.giphy.com/dashboard/
* https://developers.giphy.com/explorer/


## Giphy

Search for a random cat image:

```
https://api.giphy.com/v1/gifs/random?api_key=#{api_key}&tag=cats&rating=G
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