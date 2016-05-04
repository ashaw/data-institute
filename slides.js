var extend = function(obj){
  var others = [].slice.call(arguments,1);
  others.forEach(function(other){
    for(var j in other) obj[j] = other[j];
  });
  return obj;
}

var Node = function(value){
  this.value = value;
  this.next = null;
  this.prev = null;
  this.page = parseInt(value.getAttribute("page"), 10);
};
Node.prototype = extend(Node.prototype, {});

var List = function(){
  this.length = 0;
};
List.prototype = extend(List.prototype, {
  push : function(value) {
    var node = new Node(value);

    if(!(this.head || this.tail)){
      this.head = this.tail = node;
      this.head.next = this.head.prev = this.head;
    } else {
      node.prev = this.tail;
      this.tail.next = node;
      this.tail = node;
      this.tail.next = this.head;
      this.head.prev = this.tail;
    }

    this.length++;
  }
});

var list = new List();
var current = null;
var elems = [];

var show = function(node) { node.style.display = "block"; };
var hide = function(node) { node.style.display = "none"; };
// sets current by side effect
var next = function(){
  elems.forEach(hide);
  current = current.next;
  show(current.value);
};
// sets current by side effect
var prev = function(){
  elems.forEach(hide);
  current = current.prev;
  show(current.value);
};

var keyPress = function(e){
  if(current){
    if([32, 39].indexOf(e.keyCode) > -1) {
      next();
      window.location.hash = current.page;
    } else if([37, 8].indexOf(e.keyCode) > -1) {
      prev();
      window.location.hash = current.page;
    }
  }
};

var parseHash = function(n) {
  return parseInt(window.location.hash.replace(/#/,""), 10)
}

// sets current by side effect
var go = function(){
  elems = [].slice.call(document.getElementsByTagName("div"));
  elems.forEach(function(el, idx) {
    el.setAttribute("page", idx + 1);
    list.push(el); 
  });
  current = list.head;

  if (window.location.hash && parseHash(window.location.hash) > 1) {
    for (var i = 1; i < parseHash(window.location.hash); i++) {
      next();
    }
  } else {
    show(current.value);
  }

  document.addEventListener("keydown", keyPress, false);
  //document.addEventListener("click", next, false);
};

document.addEventListener("DOMContentLoaded", go, false);
