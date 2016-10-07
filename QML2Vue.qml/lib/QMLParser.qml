import QtQuick 2.0

import "./qmlweb.parser.js" as Parser

QtObject {

    readonly property var __qmlParser: Parser.QMLParser
    readonly property var __jsParser: Parser.JsParser
    readonly property var qmlDocument: __qmlParser.QMLDocument
    readonly property var jsResource: __qmlParser.JSResource

    /**
     *
     * @param code : qml or js code
     * @param type : qmlDocument or jsResource
     */
    function parser(code, type, mode) {
        return __qmlParser(code, type, mode);
    }

    /**
     *
     * @param path : file path
     * @param callable : callable when read file ready
     */
    function readFile(path, callable) {
        callable = callable || function(content) {
            console.log("content.length:", content.length);
        };
        var xhr = new XMLHttpRequest;
        xhr.onreadystatechange = function() {
            if(xhr.readyState === xhr.DONE) {
                callable(xhr.responseText);
            }
        }
        xhr.open("GET", path);
        xhr.send();
    }
}
