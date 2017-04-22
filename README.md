# QML2Vue

QML 2 Vue

## WHY?

Look at the follow code:

```
    <div id="app">
      <button v-on:click="reverseMessage">{{ message }}</button>
    </div>

    new Vue({
      el: '#app',
      data: {
        message: 'Hello Vue.js!'
      },
      methods: {
        reverseMessage: function () {
          this.message = this.message.split('').reverse().join('')
        }
      }
    })
```

Look at the qml code:

```
Rectangle {
    id: app
    property string message: "Hello Vue.js!"
    Button {
        text: message
        onClicked: reverseMessage();
    }
    function reverseMessage(){
        // this === app
        this.message = this.message.split('').reverse().join('');
    }
}
```

Woooo! May be twins~

