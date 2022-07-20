
var hlStartElem;
var hlEndElem;
var collhlStartElem;
var collhlEndElem;
var XPathType = "scalar";
var varType = "S";			//S = scalar, L = list, C = collection
var collXPathType = "N";    //N = collection node, P = collection property
var TRange = null;
var toggle = true;
var isDocked = true;

var hexGreen = "#00733a";
var hexYellowGreen = "#9ed927";
var hexRed = "#d5000e";
var hexOrange = "#ffd500";
var hexAzure = "#13a3f7";
var hexGray = "#b3b3b3";


function xmlDocumentBody(xdoc) {
    $("#jstree").html(xdoc);
    initSettings();
}

function findString() {
    var str = $("#tbSearch").val();

    if (str == 0)
    {
        alert("Search value is required.");
        return;
    }

    if (parseInt(navigator.appVersion) < 4)
        return;

    var strFound;

    if (window.find) {
        // browsers that support window.find

        strFound = self.find(str);
        if (!strFound) {
            strFound = self.find(str, 0, 1);
            while (self.find(str, 0, 1))
                continue;
        }
        else {
            var sel = window.getSelection();

            if (sel) {
                var pe = sel.anchorNode.parentElement;
                var h = "";
            }
        }
    }
    else if (navigator.appName.indexOf("Microsoft") != -1) {

        // IE code
        if (TRange != null) {
            TRange.collapse(false);
            strFound = TRange.findText(str);

            if (strFound) {
                TRange.select();
                var x = TRange.boundingLeft;
                var y = TRange.boundingTop;
                var elem = document.elementFromPoint(x, y);

                if (elem) {

                    var id = elem.id;
                    var tn = elem.tagName;
                    var txt = elem.innerText;
                }
            }
        }
        if (TRange == null || strFound == 0) {
            TRange = self.document.body.createTextRange();
            strFound = TRange.findText(str);
            if (strFound)
                TRange.select();
        }
    }
    else if (navigator.appName == "Opera") {
        //Opera browser not supported ??
        return;
    }
    if (!strFound)
        alert("String '" + str + "' not found")
    return;
}

$(document).ready(function () {

    $('#jstree').on("select_node.jstree", function (e, data) {

        var elem;

        if (data.event.target.className == "e" | data.event.target.className == "ce" | data.event.target.className == "a") {
            elem = data.event.target;
            setIndicators(elem);
        }

        //if ( data.event.currentTarget.childNodes[4] != null && data.event.currentTarget.childNodes[4].innerText != null )
        //	console.log( "select_node innerText: " + data.event.currentTarget.childNodes[4].innerText);

    });

    $("#btnSearch").click(function (e) {
        findString();
    });

    $("#btnToggleNodes").click(function (e) {
        ToggleAllNodes();
    });

    $("#btnToggleDock").click(function (e) {
        ToggleDock();
    });

});

function initSettings() {

    $("span:contains('<'),span:contains('>')")
		.addClass("b");


    $('#jstree').jstree({
        "core": {
            "animation": 250,
            "check_callback": true,
            "themes": { "dots": false }
        }
    });

    $("#jstree").delegate("a", "dblclick", function (e) {
        e.stopPropagation();
        e.preventDefault();

        var elem;
        var cn = e.target.className;

        if (cn == "e" | cn == "ce" | cn == "a") {

            var ename;

            if (cn == "a")
                ename = e.target.attributes["data-an"].value;
            else
                ename = e.target.childNodes[0].nodeValue;

            window.external.AddXPath(e.target.attributes["data-xp"].value,
                e.target.id, ename);

            elem = e.target;
            setIndicators(elem);
        }

       SetContextMenu();
    });

    ToggleAllNodes();
}

function SetContextMenu(){
    // Begin Tag Context menu 
    $(".e, .ce").contextMenu({
        menu: 'conMenu'
    }, function (action, elem, pos) {
            window.external.XmlNodeContextMenuClicked(action, $(elem).attr('data-xp'), 
               $(elem).attr('id'), $(elem)[0].childNodes[0].nodeValue);
        });
}

function SetToolTip(id, tt) {
    document.getElementById(id).title = tt;
}


function ToggleAllNodes() {

    if (toggle) {
        $('#jstree').jstree('open_all');
        $("#btnToggleNodes").removeClass("ExpandAll");
        $("#btnToggleNodes").addClass("collapseAll");
    }
    else {
        $('#jstree').jstree('close_all');
        $("#btnToggleNodes").removeClass("collapseAll");
        $("#btnToggleNodes").addClass("ExpandAll");
    }

    toggle = !toggle;

   SetContextMenu();
}


function ToggleDock() {

    if (isDocked) {
        $("#btnToggleDock").removeClass("detach");
        $("#btnToggleDock").addClass("dock");
    }
    else {
        $("#btnToggleDock").removeClass("dock");
        $("#btnToggleDock").addClass("detach");
    }

    isDocked = !isDocked;

    window.external.ToggleBrowserLocation();

}

function setVariableType(vt) {
    varType = vt;

    if (vt != "C")
        unhighlightCollElements();

    unhighlightElements();
}

function setCollXPathType(cxt) {
    collXPathType = cxt;

    if (cxt == "N") {
        unhighlightCollElements();
        unhighlightElements();
    }
}

function setIndicators(elem) {
    if (varType == "C") {
        if (collXPathType == "N") {
            unhighlightCollElements();
            highlightElements(true, elem, hexGreen, hexYellowGreen);
        }
        else {
            unhighlightElements();
            highlightElements(false, elem, hexRed, hexOrange);
        }
    }
    else {
        unhighlightElements();
        highlightElements(false, elem, hexRed, hexOrange);
    }
}

function highlightElements(isColl, elem, fc, hc) {

    if (elem != null && elem.id != "" && elem.id != "jstree") {
        var n = elem.id.lastIndexOf('.');

        if (n != -1 && elem.id.substring(n) == ".c") {
            if (isColl)
                collhlEndElem = elem;
            else
                hlEndElem = elem;

            elem.setAttribute("style", "color:" + fc + ";background:" + hc + ";");

            var startElem = document.getElementById(elem.id.substring(0, n));

            if (isColl)
                collhlStartElem = startElem;
            else
                hlStartElem = startElem;

            startElem.setAttribute("style", "color:" + fc + ";background:" + hc + ";");
        }
        else if (n != -1 && elem.id.substring(n) == ".a") {
            if (isColl)
                collhlStartElem = elem;
            else
                hlStartElem = elem;
            elem.setAttribute("style", "color:" + fc + ";background:" + hc + ";");

            if (isColl)
                collhlEndElem = null;
            else
                hlEndElem = null;
        }
        else {
            if (isColl)
                collhlStartElem = elem;
            else
                hlStartElem = elem;

            elem.setAttribute("style", "color:" + fc + ";background:" + hc + ";");
            var endElem = document.getElementById(elem.id + ".c");

            if (endElem) {
                if (isColl)
                    collhlEndElem = endElem;
                else
                    hlEndElem = endElem;

                endElem.setAttribute("style", "color:" + fc + ";background:" + hc + ";");
            }
        }
    }
}

function highlightList(elem) {
    var n = elem.id.lastIndexOf('.');
}

function unhighlightElements() {

    var col = hexAzure;

    if (hlStartElem != null && isElemAttribute(hlStartElem))
        col = hexGray;

    if (hlStartElem != null)
        hlStartElem.setAttribute("style", "color:" + col + ";background:white;");
    if (hlEndElem != null)
        hlEndElem.setAttribute("style", "color:" + col + ";background:white;");
}

function unhighlightCollElements() {

    if (collhlStartElem != null)
        collhlStartElem.setAttribute("style", "color:" + hexAzure + ";background:white;");
    if (collhlEndElem != null)
        collhlEndElem.setAttribute("style", "color:" + hexAzure + ";background:white;");
}


function disableSelect(el) {
    if (el.addEventListener) {
        el.addEventListener("mousedown", disabler, "false");
    }
    else {
        el.attachEvent("onselectstart", disabler);
    }
}

function enableSelect(el) {
    if (el.addEventListener) {
        el.removeEventListener("mousedown", disabler, "false");
    }
    else {
        el.detachEvent("onselectstart", disabler);
    }
}

function disabler(e) {
    if (e.preventDefault) { e.preventDefault(); }
    return false;
}


function disableTextSelect() {
    //disableSelect(document.getElementById("jstree"));
}

function isElemAttribute(elem) {
    if (elem != null && elem.id != null && elem.id.substr(elem.id.length - 2, 2) == ".a")
        return true;
    else
        return false;
}

