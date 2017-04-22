# vue.js 与 QML

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

> 上诉代码来自[vue.js/处理用户输入](http://cn.vuejs.org/guide/index.html#u5904_u7406_u7528_u6237_u8F93_u5165)

```
import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id: app

    property string message: "Hello Vue.js!"

    Button {
        text: "Reverse Message"
        onClicked: reverseMessage();
    }
    function reverseMessage(){
        // this === app
        this.message = this.message.split('').reverse().join('');
    }
}
```

是不是感觉很相似？这个给 qmlweb 一个很大的提升参考。
