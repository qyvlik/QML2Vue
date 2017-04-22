import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
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
