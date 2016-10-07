import QtQuick 2.0

import "lib"

Item {

    width: 640
    height: 360

    Text {
        id: showText
        anchors.fill: parent
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }

    /**
     * @qmlAst array of array, mean tree
     */
    function qml2vue(qmlAst) {
        qml2vue_top(qmlAst[0]);
        qml2vue_imports(qmlAst[1]);
        for(var iter = 2; iter < qmlAst.length; iter++) {
            qml2vue_root(qmlAst[iter]);
        }
    }

    function qml2vue_top(qmlAst) {
        console.log("qml2vue_top: "+qmlAst);

    }

    function qml2vue_imports(qmlAst) {
        for(var iter in qmlAst) {
            console.log("qml2vue_import: "+qmlAst[iter]);
        }

    }

    function qml2vue_root(qmlAst) {
//        console.log(qmlAst);
        for(var iter in qmlAst) {
            if(typeof qmlAst[iter] !== 'undefined' ) {

                if(qmlAst[iter][0] === 'qmlprop') {
                    qml2vue_qmlproperties(qmlAst[iter]);
                } else {
                    console.log(qmlAst[iter]);
                }
            }
        }
    }

    function qml2vue_qmlproperties(qmlAst) {
        for(var iter in qmlAst) {
            console.log("qml2vue_qmlproperty: " + qmlAst[iter]);
        }
    }



    QMLParser {
        id: parser
    }

    Component.onCompleted: {
        parser.readFile(Qt.resolvedUrl("./tests/test1.qml"), function(content){
            try {
                var qmlAst = parser.parser(content, parser.qmlDocument);
                showText.text = qmlAst.toString();
                qml2vue(qmlAst);
            } catch(e) {
                console.log("comment", e.comment);
                console.log("message", e.message);
                console.log("file", e.file);
            }
        });
    }

}
