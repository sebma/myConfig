// ==UserScript==
// @name		ViewTube
// @version		2019.03.02
// @description		Watch videos from video sharing websites with extra options.
// @author		sebaro
// @namespace		http://sebaro.pro/viewtube
// @downloadURL		https://gitlab.com/sebaro/viewtube/raw/master/viewtube.user.js
// @updateURL		https://gitlab.com/sebaro/viewtube/raw/master/viewtube.user.js
// @icon		https://gitlab.com/sebaro/viewtube/raw/master/viewtube.png
// @include		http://youtube.com*
// @include		http://www.youtube.com*
// @include		https://youtube.com*
// @include		https://www.youtube.com*
// @include		http://gaming.youtube.com*
// @include		https://gaming.youtube.com*
// @include		http://m.youtube.com*
// @include		https://m.youtube.com*
// @include		http://dailymotion.com*
// @include		http://www.dailymotion.com*
// @include		https://dailymotion.com*
// @include		https://www.dailymotion.com*
// @include		http://vimeo.com*
// @include		http://www.vimeo.com*
// @include		https://vimeo.com*
// @include		https://www.vimeo.com*
// @include		http://metacafe.com*
// @include		http://www.metacafe.com*
// @include		https://metacafe.com*
// @include		https://www.metacafe.com*
// @include		http://veoh.com*
// @include		http://www.veoh.com*
// @include		https://veoh.com*
// @include		https://www.veoh.com*
// @include		http://viki.com*
// @include		http://www.viki.com*
// @include		https://viki.com*
// @include		https://www.viki.com*
// @include		http://imdb.com*
// @include		http://www.imdb.com*
// @include		https://imdb.com*
// @include		https://www.imdb.com*
// @noframes
// @grant		none
// @run-at		document-end
// ==/UserScript==


/*

  Copyright (C) 2010 - 2019 Sebastian Luncan

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program. If not, see <http://www.gnu.org/licenses/>.

  Website: http://sebaro.pro/viewtube
  Contact: http://sebaro.pro/contact

*/


(function() {


// Don't run on frames or iframes
if (window.top != window.self) return;


// ==========Variables========== //

// Userscript
var userscript = 'ViewTube';

// Page
var page = {win: window, doc: window.document, body: window.document.body, url: window.location.href, site: window.location.hostname.match(/([^.]+)\.[^.]+$/)[1]};

// Player
var player = {};
var feature = {'autoplay': true, 'definition': true, 'container': true, 'dash': false, 'direct': false, 'widesize': true, 'fullsize': true};
var option = {'plugin': 'Auto', 'autoplay': false, 'autoget': false, 'definition': 'HD', 'container': 'MP4', 'dash': false, 'direct': false, 'widesize': false, 'fullsize': false};
var plugins = ['Auto', 'Alt', 'HTML5', 'VLC', 'MP4', 'MPEG', 'VTP'];
if (navigator.platform.indexOf('Win') != -1) plugins = plugins.concat(['WMP', 'WMP2', 'QT']);
else if (navigator.platform.indexOf('Mac') != -1) plugins = plugins.concat(['QT']);
else plugins = plugins.concat(['MPV', 'Totem', 'Xine']);
var mimetypes = {
  'MPEG': 'video/mpeg',
  'MP4': 'video/mp4',
  'WebM': 'video/webm',
  '3GP': 'video/3gpp',
  'WMP': 'application/x-ms-wmp',
  'WMP2': 'application/x-mplayer2',
  'QT': 'video/quicktime',
  'VLC': 'application/x-vlc-plugin',
  'MPV': 'video/mp4',
  'Totem': 'application/x-totem-plugin',
  'Xine': 'application/x-xine-plugin'
};
var sources = {};

// Player Window
var myPlayerWindow;

// Intervals
var intervals = [];

// Links
var website = 'http://sebaro.pro/viewtube';
var contact = 'http://sebaro.pro/contact';


// ==========Functions========== //

function createMyElement(type, content, event, action, target) {
  var obj = page.doc.createElement(type);
  if (content) {
    if (type == 'div') obj.innerHTML = content;
    else if (type == 'img') obj.src = content;
    else if (type == 'option') {
      obj.value = content;
      obj.innerHTML = content;
    }
    else if (type == 'video') {
      obj.src = content;
      obj.controls = 'controls';
      obj.autoplay = 'autoplay';
      obj.volume = 0.8;
      obj.innerHTML = '<br><br>The video should be loading. If it doesn\'t load, make sure your browser supports HTML5\'s Video and this video codec. If you think it\'s a script issue, please report it <a href="' + contact + '" style="color:#00892C">here</a>.';
    }
    else if (type == 'object') {
      obj.data = content;
      obj.innerHTML = '<br><br>The video should be loading. If it doesn\'t load, make sure a video plugin is installed. If you think it\'s a script issue, please report it <a href="' + contact + '" style="color:#00892C">here</a>.<param name="scale" value="aspect"><param name="stretchtofit" value="true"><param name="autostart" value="true"><param name="autoplay" value="true">';
    }
    else if (type == 'embed') {
      if (option['plugin'] == 'VLC') obj.setAttribute('target', content);
      else obj.src = content;
      obj.innerHTML = '<br><br>The video should be loading. If it doesn\'t load, make sure a video plugin is installed. If you think it\'s a script issue, please report it <a href="' + contact + '" style="color:#00892C">here</a>.<param name="scale" value="aspect"><param name="stretchtofit" value="true"><param name="autostart" value="true"><param name="autoplay" value="true">';
    }
  }
  if (type == 'video' || type == 'object' || type == 'embed') {
    if (option['plugin'] == 'Auto' || option['plugin'] == 'Alt' || option['plugin'] == 'HTML5') {
      obj.type = mimetypes[player['videoPlay'].replace(/.*\s/, '')];
    }
    else {
      obj.type = mimetypes[option['plugin']];
    }
    obj.id = 'vtVideo';
  }
  if (event == 'change') {
    if (target == 'video') {
      obj.addEventListener('change', function() {
	player['videoPlay'] = this.value;
	if (player['isGetting']) {
	  modifyMyElement(player['buttonGet'] , 'div', 'Get', false);
	  player['isGetting'] = false;
	}
	if (player['isPlaying']) playMyVideo(option['autoplay']);
      }, false);
    }
    else if (target == 'plugin') {
      obj.addEventListener('change', function() {
	option['plugin'] = this.value;
	setMyOptions('plugin', option['plugin']);
	if (player['isPlaying']) playMyVideo(true);
      }, false);
    }
  }
  else if (event == 'click') {
    obj.addEventListener('click', function() {
      if (action == 'close') {
	removeMyElement(page.body, target);
      }
      else if (action == 'logo') {
	page.win.location.href = website;
      }
      else if (action == 'play') {
	playMyVideo(!player['isPlaying']);
      }
      else if (action == 'get') {
	getMyVideo();
      }
      else if (action == 'autoplay') {
	option['autoplay'] = (option['autoplay']) ? false : true;
	if (option['autoplay']) {
	  styleMyElement(player['buttonAutoplay'], {color: '#008080', textShadow: '0px 1px 1px #CCCCCC'});
	  if (!player['isPlaying']) playMyVideo(true);
	}
	else {
	  styleMyElement(player['buttonAutoplay'], {color: '#CCCCCC', textShadow: '0px 0px 0px'});
	  playMyVideo(false);
	}
	setMyOptions('autoplay', option['autoplay']);
      }
      else if (action == 'definition') {
	for (var itemDef = 0; itemDef < option['definitions'].length; itemDef++) {
	  if (option['definitions'][itemDef].match(/[A-Z]/g).join('') == option['definition']) {
	    var nextDef = (itemDef + 1 < option['definitions'].length) ? itemDef + 1 : 0;
	    option['definition'] = option['definitions'][nextDef].match(/[A-Z]/g).join('');
	    break;
	  }
	}
	modifyMyElement(player['buttonDefinition'], 'div', option['definition'], false);
	setMyOptions('definition', option['definition']);
	if (player['isGetting']) {
	  modifyMyElement(player['buttonGet'] , 'div', 'Get', false);
	  player['isGetting'] = false;
	}
	selectMyVideo();
	if (player['isPlaying']) playMyVideo(true);
      }
      else if (action == 'container') {
	for (var itemCont = 0; itemCont < option['containers'].length; itemCont++) {
	  if (option['containers'][itemCont] == option['container']) {
	    var nextCont = (itemCont + 1 < option['containers'].length) ? itemCont + 1 : 0;
	    option['container'] = option['containers'][nextCont];
	    break;
	  }
	}
	modifyMyElement(player['buttonContainer'], 'div', option['container'], false);
	setMyOptions('container', option['container']);
	if (player['isGetting']) {
	  modifyMyElement(player['buttonGet'] , 'div', 'Get', false);
	  player['isGetting'] = false;
	}
	selectMyVideo();
	if (player['isPlaying']) playMyVideo(true);
      }
      else if (action == 'dash') {
	option['dash'] = (option['dash']) ? false : true;
	if (option['dash']) {
	  styleMyElement(player['buttonDASH'], {color: '#008080', textShadow: '0px 1px 1px #CCCCCC'});
	}
	else {
	  styleMyElement(player['buttonDASH'], {color: '#CCCCCC', textShadow: '0px 0px 0px'});
	}
	setMyOptions('dash', option['dash']);
      }
      else if (action == 'direct') {
	option['direct'] = (option['direct']) ? false : true;
	if (option['direct']) {
	  styleMyElement(player['buttonDirect'], {color: '#008080', textShadow: '0px 1px 1px #CCCCCC'});
	}
	else {
	  styleMyElement(player['buttonDirect'], {color: '#CCCCCC', textShadow: '0px 0px 0px'});
	}
	setMyOptions('direct', option['direct']);
	selectMyVideo();
	if (player['isPlaying']) playMyVideo(true);
      }
      else if (action == 'widesize') {
	option['widesize'] = (option['widesize']) ? false : true;
	setMyOptions('widesize', option['widesize']);
	resizeMyPlayer('widesize');
      }
      else if (action == 'fullsize') {
	option['fullsize'] = (option['fullsize']) ? false : true;
	setMyOptions('fullsize', option['fullsize']);
	resizeMyPlayer('fullsize');
      }
    }, false);
  }
  return obj;
}

function getMyElement(obj, type, from, value, child, content) {
  var getObj, chObj, coObj;
  var pObj = (!obj) ? page.doc : obj;
  if (type == 'body') getObj = pObj.body;
  else {
    if (from == 'id') getObj = pObj.getElementById(value);
    else if (from == 'class') getObj = pObj.getElementsByClassName(value);
    else if (from == 'tag') getObj = pObj.getElementsByTagName(type);
    else if (from == 'ns') getObj = pObj.getElementsByTagNameNS(value, type);
  }
  chObj = (child >= 0) ? getObj[child] : getObj;
  if (content && chObj) {
    if (type == 'html' || type == 'body' || type == 'div' || type == 'option') coObj = chObj.innerHTML;
    else if (type == 'object') coObj = chObj.data;
    else if (type == 'img' || type == 'video' || type == 'embed') coObj = chObj.src;
    else coObj = chObj.textContent;
    return coObj;
  }
  else {
    return chObj;
  }
}

function modifyMyElement(obj, type, content, clear, hide) {
  if (content) {
    if (type == 'div') obj.innerHTML = content;
    else if (type == 'option') {
      obj.value = content;
      obj.innerHTML = content;
    }
    else if (type == 'object') obj.data = content;
    else if (type == 'img' || type == 'video' || type == 'embed') obj.src = content;
  }
  if (clear) {
    if (obj.hasChildNodes()) {
      while (obj.childNodes.length >= 1) {
        obj.removeChild(obj.firstChild);
      }
    }
  }
  if (hide) {
    for (var i = 0; i < obj.children.length; i++) {
      styleMyElement(obj.children[i], {display: 'none'});
    }
  }
}

function styleMyElement(obj, styles) {
  for (var property in styles) {
    if (styles.hasOwnProperty(property)) obj.style[property] = styles[property];
  }
}

function appendMyElement(parent, child) {
  parent.appendChild(child);
}

function removeMyElement(parent, child) {
  parent.removeChild(child);
}

function replaceMyElement(parent, orphan, child) {
  parent.replaceChild(orphan, child);
}

function createMyPlayer() {
  /* Get My Options */
  getMyOptions();

  /* Player Settings */
  player['panelHeight'] = 18;
  player['panelPadding'] = 2;

  /* The Panel */
  var panelWidth = player['playerWidth'] - player['panelPadding'] * 2;
  player['playerPanel'] = createMyElement('div', '', '', '', '');
  styleMyElement(player['playerPanel'], {width: panelWidth + 'px', height: player['panelHeight'] + 'px', padding: player['panelPadding'] + 'px', backgroundColor: 'inherit', textAlign: 'center'});
  appendMyElement(player['playerWindow'], player['playerPanel']);

  /* Panel Items */
  var panelItemBorder = 1;
  var panelItemHeight = player['panelHeight'] - panelItemBorder * 2;

  /* Panel Logo */
  player['panelLogo'] = createMyElement('div', userscript + ': ', 'click', 'logo', '');
  player['panelLogo'].title = '{ViewTube: click to visit the script web page}';
  styleMyElement(player['panelLogo'], {height: panelItemHeight + 'px', padding: '0px', display: 'inline', color: '#336699', fontSize: '12px', textShadow: '0px 1px 1px #CCCCCC', cursor: 'pointer'});
  appendMyElement(player['playerPanel'], player['panelLogo']);

  /* Panel Video Menu */
  player['videoMenu'] = createMyElement('select', '', 'change', '', 'video');
  player['videoMenu'].title = '{Videos: select the video format for playback}';
  styleMyElement(player['videoMenu'], {width: '200px', height: panelItemHeight + 'px', border: '1px solid transparent', padding: '0px', display: 'inline', backgroundColor: 'inherit', color: '#336699', fontSize: '12px', textShadow: '0px 1px 1px #CCCCCC', verticalAlign: 'baseline', cursor: 'pointer'});
  appendMyElement(player['playerPanel'], player['videoMenu'] );
  for (var videoCode in player['videoList']) {
    player['videoItem'] = createMyElement('option', videoCode, '', '', '');
    styleMyElement(player['videoItem'], {padding: '0px', display: 'block', color: '#336699', fontSize: '12px', textShadow: '0px 1px 1px #CCCCCC', cursor: 'pointer'});
    if (videoCode.indexOf('Video') != -1 || videoCode.indexOf('Audio') != -1) styleMyElement(player['videoItem'], {color: '#8F6B32'});
    if (player['videoList'][videoCode] == 'DASH') styleMyElement(player['videoItem'], {color: '#CF4913'});
    if (player['videoList'][videoCode] != 'DASH' || option['dash']) appendMyElement(player['videoMenu'], player['videoItem']);
    else delete player['videoList'][videoCode];
    if (videoCode == 'Direct Video Link') styleMyElement(player['videoItem'], {color: '#00C0C0'});
  }

  /* Panel Plugin Menu */
  player['pluginMenu'] = createMyElement('select', '', 'change', '', 'plugin');
  player['pluginMenu'].title = '{Plugins: select the video plugin for playback}';
  styleMyElement(player['pluginMenu'], {width: '70px', height: panelItemHeight + 'px', border: '1px solid transparent', padding: '0px', display: 'inline', backgroundColor: 'inherit', color: '#336699', fontSize: '12px', textShadow: '0px 1px 1px #CCCCCC', verticalAlign: 'baseline', cursor: 'pointer'});
  appendMyElement(player['playerPanel'], player['pluginMenu'] );
  for (var p = 0; p < plugins.length; p++) {
    player['pluginItem'] = createMyElement('option', plugins[p], '', '', '');
    styleMyElement(player['pluginItem'], {padding: '0px', display: 'block', color: '#336699', fontSize: '12px', textShadow: '0px 1px 1px #CCCCCC', cursor: 'pointer'});
    appendMyElement(player['pluginMenu'], player['pluginItem']);
  }
  player['pluginMenu'].value = option['plugin'];

  /* Panel Play Button */
  player['buttonPlay'] = createMyElement('div', 'Play', 'click', 'play', '');
  player['buttonPlay'].title = '{Play/Stop: click to start/stop video playback}';
  styleMyElement(player['buttonPlay'], {height: panelItemHeight + 'px', border: '1px solid #CCCCCC', borderRadius: '3px', padding: '0px 5px', display: 'inline', color: '#37B704', fontSize: '12px', textShadow: '0px 1px 1px #CCCCCC', cursor: 'pointer'});
  appendMyElement(player['playerPanel'], player['buttonPlay']);

  /* Panel Autoplay Button */
  if (feature['autoplay']) {
    player['buttonAutoplay'] = createMyElement('div', 'AP', 'click', 'autoplay', '');
    player['buttonAutoplay'].title = '{Autoplay: click to enable/disable auto playback on page load}';
    styleMyElement(player['buttonAutoplay'], {height: panelItemHeight + 'px', border: '1px solid #CCCCCC', borderRadius: '3px', padding: '0px 5px', display: 'inline', color: '#CCCCCC', fontSize: '12px', cursor: 'pointer'});
    if (option['autoplay']) styleMyElement(player['buttonAutoplay'], {color: '#008080', textShadow: '0px 1px 1px #CCCCCC'});
    appendMyElement(player['playerPanel'], player['buttonAutoplay']);
  }

  /* Panel Get Button */
  player['buttonGet'] = createMyElement('div', 'Get', 'click', 'get', '');
  player['buttonGet'].title = '{Get: click to download the selected video format}';
  styleMyElement(player['buttonGet'], {height: panelItemHeight + 'px', border: '1px solid #CCCCCC', borderRadius: '3px', padding: '0px 5px', display: 'inline', color: '#C000C0', fontSize: '12px', textShadow: '0px 1px 1px #CCCCCC', cursor: 'pointer'});
  appendMyElement(player['playerPanel'], player['buttonGet']);

  /* Panel Definition Button */
  if (feature['definition']) {
    player['buttonDefinition'] = createMyElement('div', option['definition'], 'click', 'definition', '');
    player['buttonDefinition'].title = '{Definition: click to change the preferred video definition}';
    styleMyElement(player['buttonDefinition'], {height: panelItemHeight + 'px', border: '1px solid #CCCCCC', borderRadius: '3px', padding: '0px 5px', display: 'inline', color: '#008000', fontSize: '12px', textShadow: '0px 1px 1px #CCCCCC', cursor: 'pointer'});
    appendMyElement(player['playerPanel'], player['buttonDefinition']);
  }

  /* Panel Container Button */
  if (feature['container']) {
    player['buttonContainer'] = createMyElement('div', option['container'], 'click', 'container', '');
    player['buttonContainer'].title = '{Container: click to change the preferred video container}';
    styleMyElement(player['buttonContainer'], {height: panelItemHeight + 'px', border: '1px solid #CCCCCC', borderRadius: '3px', padding: '0px 5px', display: 'inline', color: '#008000', fontSize: '12px', textShadow: '0px 1px 1px #CCCCCC', cursor: 'pointer'});
    appendMyElement(player['playerPanel'], player['buttonContainer']);
  }

  /* Panel DASH Button */
  if (feature['dash']) {
    player['buttonDASH'] = createMyElement('div', 'MD', 'click', 'dash', '');
    player['buttonDASH'].title = '{MPEG-DASH: click to enable/disable DASH playback using the HTML5 video player (experimental)}';
    styleMyElement(player['buttonDASH'], {height: panelItemHeight + 'px', border: '1px solid #CCCCCC', borderRadius: '3px', padding: '0px 5px', display: 'inline', color: '#CCCCCC', fontSize: '12px', cursor: 'pointer'});
    if (option['dash']) styleMyElement(player['buttonDASH'], {color: '#008080', textShadow: '0px 1px 1px #CCCCCC'});
    appendMyElement(player['playerPanel'], player['buttonDASH']);
  }

  /* Panel Direct Button */
  if (feature['direct']) {
    player['buttonDirect'] = createMyElement('div', 'DVL', 'click', 'direct', '');
    player['buttonDirect'].title = '{DVL: click to enable/disable auto selection of Direct Video Link}';
    styleMyElement(player['buttonDirect'], {height: panelItemHeight + 'px', border: '1px solid #CCCCCC', borderRadius: '3px', padding: '0px 5px', display: 'inline', color: '#CCCCCC', fontSize: '12px', cursor: 'pointer'});
    if (option['direct']) styleMyElement(player['buttonDirect'], {color: '#008080', textShadow: '0px 1px 1px #CCCCCC'});
    appendMyElement(player['playerPanel'], player['buttonDirect']);
  }

  /* Panel Widesize Button */
  if (feature['widesize']) {
    if (option['widesize']) player['buttonWidesize'] = createMyElement('div', '&lt;', 'click', 'widesize', '');
    else player['buttonWidesize'] = createMyElement('div', '&gt;', 'click', 'widesize', '');
    player['buttonWidesize'].title = '{Widesize: click to enter player widesize or return to normal size}';
    styleMyElement(player['buttonWidesize'], {height: panelItemHeight + 'px', border: '1px solid #CCCCCC', borderRadius: '3px', padding: '0px 5px', display: 'inline', color: '#C05800', fontSize: '12px', textShadow: '1px 1px 2px #CCCCCC', cursor: 'pointer'});
    appendMyElement(player['playerPanel'], player['buttonWidesize']);
  }

  /* Panel Fullsize Button */
  if (feature['fullsize']) {
    if (option['fullsize']) player['buttonFullsize'] = createMyElement('div', '-', 'click', 'fullsize', '');
    else player['buttonFullsize'] = createMyElement('div', '+', 'click', 'fullsize', '');
    player['buttonFullsize'].title = '{Fullsize: click to enter player fullsize or return to normal size}';
    styleMyElement(player['buttonFullsize'], {height: panelItemHeight + 'px', border: '1px solid #CCCCCC', borderRadius: '3px', padding: '0px 5px', display: 'inline', color: '#C05800', fontSize: '12px', textShadow: '1px 1px 2px #CCCCCC', cursor: 'pointer'});
    appendMyElement(player['playerPanel'], player['buttonFullsize']);
  }

  /* The Content */
  player['contentWidth'] = player['playerWidth'];
  player['contentHeight'] = player['playerHeight'] - player['panelHeight'] - player['panelPadding'] * 2;
  player['playerContent'] = createMyElement('div', '', '', '', '');
  styleMyElement(player['playerContent'], {width: player['contentWidth'] + 'px', height: player['contentHeight'] + 'px', position: 'relative', color: '#AD0000', backgroundColor: '#000000', fontSize: '14px', fontWeight: 'bold', textAlign: 'center'});
  appendMyElement(player['playerWindow'], player['playerContent']);

  /* The Video Thumbnail */
  if (player['videoThumb']) {
    player['contentImage'] = createMyElement('img', player['videoThumb'], 'click', 'play', '');
    player['contentImage'].title = '{Click to start video playback}';
    styleMyElement(player['contentImage'], {maxWidth: '100%', maxHeight: '100%', position: 'absolute', top: '0px', left: '0px', right: '0px', bottom: '0px', margin: 'auto', border: '0px', cursor: 'pointer'});
    player['contentImage'].addEventListener('load', function() {
      if (this.width/this.height >= player['contentWidth']/player['contentHeight']) {
	this.style.width = '100%';
      }
      else {
	this.style.height = '100%';
      }
    });
  }

  /* Disabled Features */
  if (!feature['autoplay']) option['autoplay'] = false;
  if (!feature['dash']) option['dash'] = false;
  if (!feature['widesize']) option['widesize'] = false;
  if (!feature['fullsize']) option['fullsize'] = false;

  /* Resize My Player */
  if (option['widesize']) resizeMyPlayer('widesize');
  if (option['fullsize']) resizeMyPlayer('fullsize');

  /* Select My Video */
  if (feature['definition'] || feature['container']) selectMyVideo();

  /* Play My Video */
  playMyVideo(option['autoplay']);
}

function selectMyVideo() {
  var vdoCont = (option['container'] != 'Any') ? [option['container']] : option['containers'];
  var vdoDef = option['definitions'];
  var vdoList = {};
  for (var vC = 0; vC < vdoCont.length; vC++) {
    if (vdoCont[vC] != 'Any') {
      for (var vD = 0; vD < vdoDef.length; vD++) {
	var format = vdoDef[vD] + ' ' + vdoCont[vC];
	if (!vdoList[vdoDef[vD]]) {
	  for (var vL in player['videoList']) {
	    if (vL == format) {
	      vdoList[vdoDef[vD]] = vL;
	      break;
	    }
	  }
	}
      }
    }
  }
  if (option['definition'] == 'UHD') {
    if (vdoList['Ultra High Definition']) player['videoPlay'] = vdoList['Ultra High Definition'];
    else if (vdoList['Full High Definition']) player['videoPlay'] = vdoList['Full High Definition'];
    else if (vdoList['High Definition']) player['videoPlay'] = vdoList['High Definition'];
    else if (vdoList['Standard Definition']) player['videoPlay'] = vdoList['Standard Definition'];
    else if (vdoList['Low Definition']) player['videoPlay'] = vdoList['Low Definition'];
    else if (vdoList['Very Low Definition']) player['videoPlay'] = vdoList['Very Low Definition'];
  }
  else if (option['definition'] == 'FHD') {
    if (vdoList['Full High Definition']) player['videoPlay'] = vdoList['Full High Definition'];
    else if (vdoList['High Definition']) player['videoPlay'] = vdoList['High Definition'];
    else if (vdoList['Standard Definition']) player['videoPlay'] = vdoList['Standard Definition'];
    else if (vdoList['Low Definition']) player['videoPlay'] = vdoList['Low Definition'];
    else if (vdoList['Very Low Definition']) player['videoPlay'] = vdoList['Very Low Definition'];
  }
  else if (option['definition'] == 'HD') {
    if (vdoList['High Definition']) player['videoPlay'] = vdoList['High Definition'];
    else if (vdoList['Standard Definition']) player['videoPlay'] = vdoList['Standard Definition'];
    else if (vdoList['Low Definition']) player['videoPlay'] = vdoList['Low Definition'];
    else if (vdoList['Very Low Definition']) player['videoPlay'] = vdoList['Very Low Definition'];
  }
  else if (option['definition'] == 'SD') {
    if (vdoList['Standard Definition']) player['videoPlay'] = vdoList['Standard Definition'];
    else if (vdoList['Low Definition']) player['videoPlay'] = vdoList['Low Definition'];
    else if (vdoList['Very Low Definition']) player['videoPlay'] = vdoList['Very Low Definition'];
  }
  else if (option['definition'] == 'LD') {
    if (vdoList['Low Definition']) player['videoPlay'] = vdoList['Low Definition'];
    else if (vdoList['Very Low Definition']) player['videoPlay'] = vdoList['Very Low Definition'];
  }
  else if (option['definition'] == 'VLD') {
    if (vdoList['Very Low Definition']) player['videoPlay'] = vdoList['Very Low Definition'];
    else if (vdoList['Low Definition']) player['videoPlay'] = vdoList['Low Definition'];
  }
  if (option['direct']) player['videoPlay'] = 'Direct Video Link';
  player['videoMenu'].value = player['videoPlay'];
}

function playDASHwithVLC() {
  if (player['videoPlay'].indexOf('MP4') != -1) {
    player['contentVideo'] = createMyElement('embed', player['videoList'][player['videoPlay'].replace(/MP4/, 'Video MP4')], '', '', '');
    if (player['videoList']['Medium Bitrate Audio Opus']) {
      player['contentAudio'] = createMyElement('embed', player['videoList']['Medium Bitrate Audio Opus'], '', '', '');
    }
    else {
      player['contentAudio'] = createMyElement('embed', player['videoList']['Medium Bitrate Audio MP4'], '', '', '');
    }
  }
  else {
    player['contentVideo'] = createMyElement('embed', player['videoList'][player['videoPlay'].replace(/WebM/, 'Video WebM')], '', '', '');
    if (player['videoList']['Medium Bitrate Audio Opus']) {
      player['contentAudio'] = createMyElement('embed', player['videoList']['Medium Bitrate Audio Opus'], '', '', '');
    }
    else {
      player['contentAudio'] = createMyElement('embed', player['videoList']['Medium Bitrate Audio WebM'], '', '', '');
    }
  }
  styleMyElement(player['contentAudio'], {position: 'absolute', zIndex: '-1', width: '1px', height: '1px'});
  appendMyElement(player['playerContent'], player['contentAudio']);
  player['contentVLCInit'] = page.win.setInterval(function() {
    if (player['contentAudio'].wrappedJSObject.playlist && player['contentVideo'].wrappedJSObject.playlist
      && player['contentAudio'].wrappedJSObject.input && player['contentVideo'].wrappedJSObject.input) {
      player['contentVLCVideoPosition'] = 0;
      player['contentVLCSync'] = page.win.setInterval(function() {
	if (!player['contentVideo'] || !player['contentVideo'].wrappedJSObject || !player['contentVideo'].wrappedJSObject.input) {
	  page.win.clearInterval(player['contentVLCSync']);
	}
	if (player['contentVideo'].wrappedJSObject.input.time != player['contentVLCVideoPosition']) {
	  if (Math.abs(player['contentVideo'].wrappedJSObject.input.time - player['contentAudio'].wrappedJSObject.input.time) >= 500) {
	    player['contentAudio'].wrappedJSObject.input.time = player['contentVideo'].wrappedJSObject.input.time;
	  }
	  player['contentVLCVideoPosition'] = player['contentVideo'].wrappedJSObject.input.time;
	}
	if (player['contentVideo'].wrappedJSObject.input.state == '4') {
	  player['contentAudio'].wrappedJSObject.playlist.pause();
	  player['contentAudioPaused'] = true;
	}
	if (player['contentVideo'].wrappedJSObject.input.state == '6') {
	  player['contentAudio'].wrappedJSObject.playlist.pause();
	  player['contentAudioPaused'] = true;
	}
	if (player['contentVideo'].wrappedJSObject.input.state == '3' && player['contentAudioPaused']) {
	  player['contentAudio'].wrappedJSObject.playlist.play();
	  player['contentAudioPaused'] = false;
	}
      }, 1000);
      page.win.clearInterval(player['contentVLCInit']);
    }
  }, 500);
}

function playDASHwithHTML5() {
  var prevPlugin = option['plugin'];
  option['plugin'] = 'HTML5';
  if (player['videoPlay'].indexOf('MP4') != -1) {
    player['contentVideo'] = createMyElement('video', player['videoList'][player['videoPlay'].replace(/MP4/, 'Video MP4')], '', '', '');
    if (player['videoList']['High Bitrate Audio Opus']) {
      player['contentAudio'] = createMyElement('video', player['videoList']['High Bitrate Audio Opus'], '', '', '');
    }
    else if (player['videoList']['Medium Bitrate Audio Opus']) {
      player['contentAudio'] = createMyElement('video', player['videoList']['Medium Bitrate Audio Opus'], '', '', '');
    }
    else {
      player['contentAudio'] = createMyElement('video', player['videoList']['Medium Bitrate Audio MP4'], '', '', '');
    }
  }
  else {
    player['contentVideo'] = createMyElement('video', player['videoList'][player['videoPlay'].replace(/WebM/, 'Video WebM')], '', '', '');
    if (player['videoList']['High Bitrate Audio Opus']) {
      player['contentAudio'] = createMyElement('video', player['videoList']['High Bitrate Audio Opus'], '', '', '');
    }
    else if (player['videoList']['Medium Bitrate Audio Opus']) {
      player['contentAudio'] = createMyElement('video', player['videoList']['Medium Bitrate Audio Opus'], '', '', '');
    }
    else {
      player['contentAudio'] = createMyElement('video', player['videoList']['Medium Bitrate Audio WebM'], '', '', '');
    }
  }
  player['contentAudio'].pause();
  player['contentVideo'].addEventListener('play', function() {
    player['contentAudio'].play();
  }, false);
  player['contentVideo'].addEventListener('pause', function() {
    player['contentAudio'].pause();
  }, false);
  player['contentVideo'].addEventListener('ended', function() {
    player['contentVideo'].pause();
    player['contentAudio'].pause();
  }, false);
  player['contentVideo'].addEventListener('timeupdate', function() {
    if (player['contentAudio'].paused && !player['contentVideo'].paused) {
      player['contentAudio'].play();
    }
    if (Math.abs(player['contentVideo'].currentTime - player['contentAudio'].currentTime) >= 0.30) {
      player['contentAudio'].currentTime = player['contentVideo'].currentTime;
    }
  }, false);
  styleMyElement(player['contentAudio'], {display: 'none'});
  appendMyElement(player['contentVideo'], player['contentAudio']);
  option['plugin'] = prevPlugin;
}

function playMyVideo(play) {
  if (play) {
    if (option['plugin'] == 'VTP') {
      if (player['videoList'][player['videoPlay']] != 'DASH') {
	page.win.location.href = 'viewtube:' + player['videoList'][player['videoPlay']];
      }
      else {
	if (player['videoPlay'].indexOf('MP4') != -1) {
	  page.win.location.href = 'viewtube:' + player['videoList'][player['videoPlay'].replace(/MP4/, 'Video MP4')] + '|' + player['videoList']['High Bitrate Audio Opus'];
	}
	else {
	  page.win.location.href = 'viewtube:' + player['videoList'][player['videoPlay'].replace(/WebM/, 'Video WebM')] + '|' + player['videoList']['High Bitrate Audio Opus'];
	}
      }
      return;
    }
    player['isPlaying'] = true;
    modifyMyElement(player['buttonPlay'], 'div', 'Stop', false);
    styleMyElement(player['buttonPlay'], {color: '#AD0000'});
    modifyMyElement(player['playerContent'], 'div', '', true);
    if (player['videoList'][player['videoPlay']] == 'DASH') {
      if (option['plugin'] == 'VLC') {
	playDASHwithVLC();
      }
      else {
	playDASHwithHTML5();
      }
    }
    else {
      if (option['plugin'] == 'HTML5') player['contentVideo'] = createMyElement('video', player['videoList'][player['videoPlay']], '', '', '');
      else if (option['plugin'] == 'Alt' || option['plugin'] == 'VLC') player['contentVideo'] = createMyElement('embed', player['videoList'][player['videoPlay']], '', '', '');
      else player['contentVideo'] = createMyElement('object', player['videoList'][player['videoPlay']], '', '', '');
    }
    player['contentVideo'].width = player['contentWidth'];
    player['contentVideo'].height = player['contentHeight'];
    styleMyElement(player['contentVideo'], {position: 'relative', width: player['contentWidth'] + 'px', height: player['contentHeight'] + 'px'});
    appendMyElement(player['playerContent'], player['contentVideo']);
  }
  else {
    player['isPlaying'] = false;
    modifyMyElement(player['buttonPlay'], 'div', 'Play', false);
    styleMyElement(player['buttonPlay'], {color: '#37B704'});
    modifyMyElement(player['playerContent'], 'div', '', true);
    if (player['contentImage']) appendMyElement(player['playerContent'], player['contentImage']);
    else showMyMessage('!thumb');
  }
}

function getMyVideo() {
  var vdoURL = player['videoList'][player['videoPlay']];
  if (vdoURL == 'DASH') return;
  if (vdoURL == page.url) return;
  var vdoDef = ' (' + player['videoPlay'].split(' ').slice(0, -1).join('').match(/[A-Z]/g).join('') + ')';
  var vdoExt = '.' + player['videoPlay'].split(' ').slice(-1).join('').toLowerCase();
  var vdoTle = (player['videoTitle']) ? player['videoTitle'] : '';
  if (option['autoget'] && vdoTle && player['videoPlay'] == 'High Definition MP4') {
    page.win.location.href = vdoURL + '&title=' + vdoTle + vdoDef;
  }
  else {
    var vdoLnk = '';
    if (vdoTle) {
      var vdoNme = vdoTle + vdoDef + vdoExt;
      vdoLnk = 'Get <a href="' + vdoURL + '" style="color:#00892C" download="' + vdoNme + '" target="_blank">Link</a>';
    }
    else {
      vdoLnk = 'Get <a href="' + vdoURL + '" style="color:#00892C" target="_blank">Link</a>';
    }
    modifyMyElement(player['buttonGet'] , 'div', vdoLnk, false);
    player['isGetting'] = true;
  }
}

function resizeMyPlayer(size) {
  if (size == 'widesize') {
    if (option['widesize']) {
      if (player['buttonWidesize']) modifyMyElement(player['buttonWidesize'], 'div', '&lt;', false);
      var playerWidth = player['playerWideWidth'];
      var playerHeight= player['playerWideHeight'];
      var sidebarMargin = player['sidebarMarginWide'];
    }
    else {
      if (player['buttonWidesize']) modifyMyElement(player['buttonWidesize'], 'div', '&gt;', false);
      var playerWidth = player['playerWidth'];
      var playerHeight= player['playerHeight'];
      var sidebarMargin = player['sidebarMarginNormal'];
    }
  }
  else if (size == 'fullsize') {
    if (option['fullsize']) {
      var playerPosition = 'fixed';
      var playerWidth = page.win.innerWidth || page.doc.documentElement.clientWidth;
      var playerHeight = page.win.innerHeight || page.doc.documentElement.clientHeight;
      var playerIndex = '9999999999';
      if (!player['isFullsize']) {
	if (feature['widesize']) styleMyElement(player['buttonWidesize'], {display: 'none'});
	modifyMyElement(player['buttonFullsize'], 'div', '-', false);
	appendMyElement(page.body, player['playerWindow']);
	styleMyElement(page.body, {overflow: 'hidden'});
	styleMyElement(page.body.parentNode, {overflow: 'hidden'});
	if (!player['resizeListener']) player['resizeListener'] = function() {resizeMyPlayer('fullsize')};
	page.win.addEventListener('resize', player['resizeListener'], false);
	player['isFullsize'] = true;
	if (player['isPlaying']) {
	  if (player['contentVideo'] && player['contentVideo'].paused) player['contentVideo'].play();
	}
      }
    }
    else {
      var playerPosition = 'relative';
      var playerWidth = (option['widesize']) ? player['playerWideWidth'] : player['playerWidth'];
      var playerHeight = (option['widesize']) ? player['playerWideHeight'] : player['playerHeight'];
      var playerIndex = 'auto';
      if (feature['widesize']) styleMyElement(player['buttonWidesize'], {display: 'inline'});
      modifyMyElement(player['buttonFullsize'], 'div', '+', false);
      appendMyElement(player['playerSocket'], player['playerWindow']);
      styleMyElement(page.body, {overflow: 'auto'});
      styleMyElement(page.body.parentNode, {overflow: 'auto'});
      page.win.removeEventListener('resize', player['resizeListener'], false);
      player['isFullsize'] = false;
      if (player['isPlaying']) {
	if (player['contentVideo'] && player['contentVideo'].paused) player['contentVideo'].play();
      }
    }
  }

  /* Resize The Player */
  if (size == 'widesize') {
    if (player['sidebarWindow']) styleMyElement(player['sidebarWindow'], {marginTop: sidebarMargin + 'px'});
    styleMyElement(player['playerSocket'], {height: playerHeight + 'px'});
    styleMyElement(player['playerWindow'], {width: playerWidth + 'px', height: playerHeight + 'px'});
  }
  else styleMyElement(player['playerWindow'], {position: playerPosition, top: '0px', left: '0px', width: playerWidth + 'px', height: playerHeight + 'px', zIndex: playerIndex});

  /* Resize The Panel */
  var panelWidth = playerWidth - player['panelPadding'] * 2;
  styleMyElement(player['playerPanel'], {width: panelWidth + 'px'});

  /* Resize The Content */
  player['contentWidth'] = playerWidth;
  player['contentHeight'] = playerHeight - player['panelHeight'] - player['panelPadding'] * 2;
  styleMyElement(player['playerContent'], {width: player['contentWidth'] + 'px', height: player['contentHeight'] + 'px'});
  if (player['isPlaying']) {
    player['contentVideo'].width = player['contentWidth'];
    player['contentVideo'].height = player['contentHeight'];
    styleMyElement(player['contentVideo'], {width: player['contentWidth'] + 'px', height: player['contentHeight'] + 'px'});
  }
}

function cleanMyContent(content, unesc) {
  var myNewContent = content;
  if (unesc) myNewContent = unescape(myNewContent);
  myNewContent = myNewContent.replace(/\\u0025/g, '%');
  myNewContent = myNewContent.replace(/\\u0026/g, '&');
  myNewContent = myNewContent.replace(/\\u002F/g, '/');
  myNewContent = myNewContent.replace(/\\/g, '');
  myNewContent = myNewContent.replace(/\n/g, '');
  return myNewContent;
}

function getMyContent(url, pattern, clean) {
  var myPageContent, myVideosParse, myVideosContent;
  if (!sources[url]) {
    var xmlHTTP = new XMLHttpRequest();
    xmlHTTP.open('GET', url, false);
    xmlHTTP.send();
    sources[url] = (xmlHTTP.responseText) ? xmlHTTP.responseText : xmlHTTP.responseXML;
    //console.log('Request: ' + url + ' ' + pattern);
  }
  if (pattern == 'TEXT') {
    myVideosContent = sources[url];
  }
  else {
    myPageContent = (sources[url]) ? sources[url] : '';
    if (clean) myPageContent = cleanMyContent(myPageContent, true);
    myVideosParse = myPageContent.match(pattern);
    myVideosContent = (myVideosParse) ? myVideosParse[1] : null;
  }
  return myVideosContent;
}

function setMyOptions(key, value) {
  key = page.site + '_' + userscript.toLowerCase() + '_' + key;
  try {
    localStorage.setItem(key, value);
    if (localStorage.getItem(key) == value) return;
    else throw false;
  }
  catch(e) {
    var date = new Date();
    date.setTime(date.getTime() + (356*24*60*60*1000));
    var expires = '; expires=' + date.toGMTString();
    page.doc.cookie = key + '=' + value + expires + '; path=/';
  }
}

function getMyOptions() {
  for (var opt in option) {
    if (option.hasOwnProperty(opt)) {
      var key = page.site + '_' + userscript.toLowerCase() + '_' + opt;
      try {
	if (localStorage.getItem(key)) {
	  option[opt] = localStorage.getItem(key);
	  continue;
	}
	else throw false;
      }
      catch(e) {
	var cookies = page.doc.cookie.split(';');
	for (var i=0; i < cookies.length; i++) {
	  var cookie = cookies[i];
	  while (cookie.charAt(0) == ' ') cookie = cookie.substring(1, cookie.length);
	  option[opt] = (cookie.indexOf(key) == 0) ? cookie.substring(key.length + 1, cookie.length) : option[opt];
	}
      }
    }
  }
  option['autoplay'] = (option['autoplay'] === true || option['autoplay'] == 'true') ? true : false;
  option['dash'] = (option['dash'] === true || option['dash'] == 'true') ? true : false;
  option['direct'] = (option['direct'] === true || option['direct'] == 'true') ? true : false;
  option['widesize'] = (option['widesize'] === true || option['widesize'] == 'true') ? true : false;
  option['fullsize'] = (option['fullsize'] === true || option['fullsize'] == 'true') ? true : false;
}

function showMyMessage(cause, content) {
  var myScriptLogo = createMyElement('div', userscript, '', '', '');
  styleMyElement(myScriptLogo, {margin: '0px auto', padding: '10px', color: '#666666', fontSize: '24px', textAlign: 'center', textShadow: '#FFFFFF -1px -1px 2px'});
  var myScriptMess = createMyElement('div', '', '', '', '');
  styleMyElement(myScriptMess, {border: '1px solid #F4F4F4', margin: '5px auto 5px auto', padding: '10px', backgroundColor: '#FFFFFF', color: '#AD0000', textAlign: 'center'});
  if (cause == '!player') {
    var myScriptAlert = createMyElement('div', '', '', '', '');
    styleMyElement(myScriptAlert, {position: 'absolute', top: '30%', left: '35%', border: '1px solid #F4F4F4', borderRadius: '3px', padding: '10px', backgroundColor: '#FFFFFF', fontSize: '14px', textAlign: 'center', zIndex: '99999'});
    appendMyElement(myScriptAlert, myScriptLogo);
    var myNoPlayerMess = 'Couldn\'t get the player element. Please report it <a href="' + contact + '" style="color:#00892C">here</a>.';
    modifyMyElement(myScriptMess, 'div', myNoPlayerMess, false);
    appendMyElement(myScriptAlert, myScriptMess);
    var myScriptAlertButton = createMyElement('div', 'OK', 'click', 'close', myScriptAlert);
    styleMyElement(myScriptAlertButton, {width: '100px', border: '3px solid #EEEEEE', borderRadius: '5px', margin: '0px auto', backgroundColor: '#EEEEEE', color: '#666666', fontSize: '18px', textAlign: 'center', textShadow: '#FFFFFF -1px -1px 2px', cursor: 'pointer'});
    appendMyElement(myScriptAlert, myScriptAlertButton);
    appendMyElement(page.body, myScriptAlert);
  }
  else if (cause == '!thumb') {
    var myNoThumbMess = '<br><br>Couldn\'t get the thumbnail for this video. Please report it <a href="' + contact + '" style="color:#00892C">here</a>.';
    modifyMyElement(player['playerContent'], 'div', myNoThumbMess, false);
  }
  else {
    appendMyElement(myPlayerWindow, myScriptLogo);
    if (cause == '!content') {
      var myNoContentMess = 'Couldn\'t get the videos content. Please report it <a href="' + contact + '" style="color:#00892C">here</a>.';
      modifyMyElement(myScriptMess, 'div', myNoContentMess, false);
    }
    else if (cause == '!videos') {
      var myNoVideosMess = 'Couldn\'t get any video. Please report it <a href="' + contact + '" style="color:#00892C">here</a>.';
      modifyMyElement(myScriptMess, 'div', myNoVideosMess, false);
    }
    else if (cause == '!support') {
      var myNoSupportMess = 'This video uses the RTMP protocol and is not supported.';
      modifyMyElement(myScriptMess, 'div', myNoSupportMess, false);
    }
    else if (cause == 'embed') {
      var myEmbedMess = 'This is an embedded video. You can watch it <a href="' + content + '" style="color:#00892C">here</a>.';
      modifyMyElement(myScriptMess, 'div', myEmbedMess, false);
    }
    else if (cause == 'other') {
      modifyMyElement(myScriptMess, 'div', content, false);
    }
    appendMyElement(myPlayerWindow, myScriptMess);
  }
}


// ==========Blocker========== //

var blockObject = page.doc;
var blockInterval = 50;

function blockVideos() {
  var elVideos = getMyElement(blockObject, 'video', 'tag', '', -1, false);
  if (elVideos.length > 0) {
    for (var v = 0; v < elVideos.length; v++) {
      var elVideo = elVideos[v];
      if (elVideo && elVideo.id != 'vtVideo' && elVideo.currentSrc) {
	if (!elVideo.paused) {
	  elVideo.pause();
	  if (page.url.indexOf('youtube.com/watch') == -1) elVideo.src = "#";
	  elVideo.addEventListener('play', function() {
	    this.pause();
	    if (page.url.indexOf('youtube.com/watch') == -1) this.src = "#";
	  });
	}
      }
    }
  }
  var elEmbeds = getMyElement(blockObject, 'embed', 'tag', '', -1, false) || getMyElement(blockObject, 'object', 'tag', '', -1, false);
  if (elEmbeds.length > 0) {
    for (var e = 0; e < elEmbeds.length; e++) {
      var elEmbed = elEmbeds[e];
      if (elEmbed && elEmbed.id != 'vtVideo' && elEmbed.parentNode) {
	removeMyElement(elEmbed.parentNode, elEmbed);
      }
    }
  }
  if (blockObject !== page.doc) {
    var elFrames = getMyElement(blockObject, 'iframe', 'tag', '', -1, false);
    if (elFrames.length > 0) {
      for (var e = 0; e < elFrames.length; e++) {
	var elFrame = elFrames[e];
	if (elFrame && elFrame.parentNode) {
	  removeMyElement(elFrame.parentNode, elFrame);
	}
      }
    }
  }
}

blockVideos();


// ==========Websites========== //

function ViewTube() {

  // =====YouTube===== //

  if (page.url.indexOf('youtube.com/watch') != -1 && getMyContent(page.url, '"text":"(youtube.com/new)"', false)) {

    /* Redirect Categories */
    if (page.url.indexOf('gaming.youtube.com') != -1) {
      page.win.location.href = page.url.replace('gaming', 'www');
    }

    /* Video Availability */
    if (getMyContent(page.url, '"playabilityStatus":\\{"status":"(ERROR|UNPLAYABLE)"', false)) return;

    /* Decrypt Signature */
    var ytScriptSrc;
    function ytDecryptSignature(s) {return null;}
    function ytDecryptFunction() {
      var ytSignFuncName, ytSignFuncBody, ytSwapFuncName, ytSwapFuncBody, ytFuncMatch;
      ytScriptSrc = ytScriptSrc.replace(/(\r\n|\n|\r)/gm, '');
      ytSignFuncName = ytScriptSrc.match(/"signature"\s*,\s*([^\)]*?)\(/);
      if (!ytSignFuncName) ytSignFuncName = ytScriptSrc.match(/d.set\(b,(?:encodeURIComponent\()?.*?([a-zA-Z0-9$]+)\(/);
      ytSignFuncName = (ytSignFuncName) ? ytSignFuncName[1] : null;
      if (ytSignFuncName) {
	ytFuncMatch = ytSignFuncName.replace(/\$/, '\\$') + '\\s*=\\s*function\\s*' + '\\s*\\(\\w+\\)\\s*\\{(.*?)\\}';
	ytSignFuncBody = ytScriptSrc.match(ytFuncMatch);
	ytSignFuncBody = (ytSignFuncBody) ? ytSignFuncBody[1] : null;
	if (ytSignFuncBody) {
	  ytSwapFuncName = ytSignFuncBody.match(/((\$|_|\w)+)\.(\$|_|\w)+\(\w,[0-9]+\)/);
	  ytSwapFuncName = (ytSwapFuncName) ? ytSwapFuncName[1] : null;
	  if (ytSwapFuncName) {
	    ytFuncMatch = 'var\\s+' + ytSwapFuncName.replace(/\$/, '\\$') + '=\\s*\\{(.*?)\\};';
	    ytSwapFuncBody = ytScriptSrc.match(ytFuncMatch);
	    ytSwapFuncBody = (ytSwapFuncBody) ? ytSwapFuncBody[1] : null;
	  }
	  if (ytSwapFuncBody) ytSignFuncBody = 'var ' + ytSwapFuncName + '={' + ytSwapFuncBody + '};' + ytSignFuncBody;
	  ytSignFuncBody = 'try {' + ytSignFuncBody + '} catch(e) {return null}';
	  ytDecryptSignature = new Function('a', ytSignFuncBody);
	}
      }
    }

    /* Player/Sidebar */
    var ytPlayerWindow, ytSidebarWindow;

    /* Player Sizes */
    var ytPlayerWidth, ytPlayerHeight;
    var ytPlayerWideWidth, ytPlayerWideHeight;
    var ytSidebarMarginWide;
    var ytScreenWidth, ytScreenHeight;
    function ytSizes() {
      if (ytPlayerWindow) {
	if (ytPlayerWindow.clientWidth) ytPlayerWidth = ytPlayerWindow.clientWidth;
	else ytPlayerWidth = ytPlayerWindow.parentNode.clientWidth;
	ytPlayerHeight = Math.ceil(ytPlayerWidth / (16 / 9)) + 22;
	if (ytSidebarWindow && ytSidebarWindow.clientWidth) ytPlayerWideWidth = ytPlayerWidth + ytSidebarWindow.clientWidth;
	else ytPlayerWideWidth = ytPlayerWidth + 425;
	ytPlayerWideHeight = Math.ceil(ytPlayerWideWidth / (16 / 9)) + 22;
	ytSidebarMarginWide = ytPlayerWideHeight + 20;
      }
    }

    /* Player Sizes Update */
    page.win.addEventListener('resize', function() {
      ytSizes();
      player['playerWidth'] = ytPlayerWidth;
      player['playerHeight'] = ytPlayerHeight;
      player['playerWideWidth'] = ytPlayerWideWidth;
      player['playerWideHeight'] = ytPlayerWideHeight;
      player['sidebarMarginWide'] = ytSidebarMarginWide;
      resizeMyPlayer('widesize');
    }, false);

    /* My Player */
    myPlayerWindow = createMyElement('div', '', '', '', '');
    styleMyElement(myPlayerWindow, {position: 'relative', width: ytPlayerWidth + 'px', height: ytPlayerHeight + 'px', backgroundColor: '#FFFFFF'});

    /* Get Player/Sidebar */
    var ytVideosReady = false;
    var ytPlayerWindowTop, ytSidebarWindowTop, ytSidebarAds, ytSidebarHead;
    var ytWaitForObjects = 5;
    var ytWaitForLoops = 50;
    var ytWaitForObject = page.win.setInterval(function() {
      /* Player Window */
      if (!ytPlayerWindow) {
	ytPlayerWindowTop = getMyElement('', 'div', 'id', 'top', -1, false);
	if (!ytPlayerWindowTop) ytPlayerWindowTop = getMyElement('', 'div', 'id', 'primary-inner', -1, false);
	if (ytPlayerWindowTop) {
	  for (var i = 0; i < ytPlayerWindowTop.children.length; i++) {
	    ytPlayerWindow = ytPlayerWindowTop.children[i];
	    if (ytPlayerWindow.id == 'player' || ytPlayerWindow.id == 'plaery') {
	      if (ytPlayerWindow.id == 'player') ytPlayerWindow.id = 'plaery'
	      modifyMyElement(ytPlayerWindow, 'div', '', false, true);
	      styleMyElement(ytPlayerWindow, {position: 'relative', width: ytPlayerWidth + 'px', height: ytPlayerHeight + 'px', backgroundColor: '#FFFFFF'});
	      appendMyElement(ytPlayerWindow, myPlayerWindow);
	      blockObject = ytPlayerWindow;
	      ytSizes();
	      ytWaitForObjects--;
	      if (ytVideosReady) ytPlayer();
	    }
	  }
	}
      }
      /* Sidebar */
      if (!ytSidebarWindow) {
	if (page.url.indexOf('list=') != -1) ytSidebarWindow = getMyElement('', 'div', 'id', 'playlist', -1, false);
	else if (getMyContent(page.url, '"livestream":"(.*?)"', false)) ytSidebarWindow = getMyElement('', 'div', 'id', 'chat', -1, false);
	else {
	  ytSidebarWindowTop = getMyElement('', 'div', 'id', 'top', -1, false);
	  if (!ytSidebarWindowTop) ytSidebarWindowTop = getMyElement('', 'div', 'id', 'secondary-inner', -1, false);
	  if (ytSidebarWindowTop) {
	    for (var i = 0; i < ytSidebarWindowTop.children.length; i++) {
	      ytSidebarWindow = ytSidebarWindowTop.children[i];
	      if (ytSidebarWindow.id == 'related') {
		break;
	      }
	    }
	  }
	}
	if (ytSidebarWindow) {
	  if (player['playerWindow'] && !player['sidebarWindow']) {
	    player['sidebarWindow'] = ytSidebarWindow;
	    ytSizes();
	    if (!option['fullsize']) resizeMyPlayer('widesize');
	  }
	  ytWaitForObjects--;
	}
      }
      /* Sidebar Ads */
      if (ytSidebarWindow) {
	/* Sidebar Ads */
	if (!ytSidebarAds) {
	  ytSidebarAds = getMyElement('', 'div', 'id', 'player-ads', -1, false);
	  if (ytSidebarAds) {
	    styleMyElement(ytSidebarAds, {display: 'none'});
	    ytWaitForObjects--;
	  }
	}
	/* Sidebar Head */
	if (!ytSidebarHead) {
	  ytSidebarHead = getMyElement('', 'div', 'id', 'head', -1, false);
	  if (ytSidebarHead) {
	    styleMyElement(ytSidebarHead, {display: 'none'});
	    ytWaitForObjects--;
	  }
	}
      }
      ytWaitForLoops--;
      if (ytWaitForLoops == 0 || ytWaitForObjects == 0) {
	if (!ytPlayerWindow) showMyMessage('!player');
	clearInterval(ytWaitForObject);
      }
    }, 500);
    intervals.push(ytWaitForObject);

    /* Create Player */
    var ytDefaultVideo = 'Low Definition MP4';
    function ytPlayer() {
      player = {
	'playerSocket': ytPlayerWindow,
	'playerWindow': myPlayerWindow,
	'videoList': ytVideoList,
	'videoPlay': ytDefaultVideo,
	'videoThumb': ytVideoThumb,
	'videoTitle': ytVideoTitle,
	'playerWidth': ytPlayerWidth,
	'playerHeight': ytPlayerHeight,
	'playerWideWidth': ytPlayerWideWidth,
	'playerWideHeight': ytPlayerWideHeight,
	'sidebarWindow': ytSidebarWindow,
	'sidebarMarginNormal': 0,
	'sidebarMarginWide': ytSidebarMarginWide
      };
      option['definitions'] = ['Ultra High Definition', 'Full High Definition', 'High Definition', 'Standard Definition', 'Low Definition', 'Very Low Definition'];
      option['containers'] = ['MP4', 'WebM', '3GP', 'Any'];
      createMyPlayer();
    }

    /* Parse Videos */
    function ytVideos() {
      var ytVideoFormats = {
	'17': 'Very Low Definition 3GP',
	'18': 'Low Definition MP4',
	'22': 'High Definition MP4',
	'36': 'Low Definition 3GP',
	'43': 'Low Definition WebM',
	'135': 'Standard Definition Video MP4',
	'136': 'High Definition Video MP4',
	'137': 'Full High Definition Video MP4',
	'140': 'Medium Bitrate Audio MP4',
	'171': 'Medium Bitrate Audio WebM',
	'244': 'Standard Definition Video WebM',
	'247': 'High Definition Video WebM',
	'248': 'Full High Definition Video WebM',
	'249': 'Low Bitrate Audio Opus',
	'250': 'Medium Bitrate Audio Opus',
	'251': 'High Bitrate Audio Opus',
	'272': 'Ultra High Definition Video WebM',
	'298': 'High Definition Video MP4',
	'299': 'Full High Definition Video MP4',
	'302': 'High Definition Video WebM',
	'303': 'Full High Definition Video WebM',
	'313': 'Ultra High Definition Video WebM',
	'315': 'Ultra High Definition Video WebM',
	'333': 'Standard Definition Video WebM',
	'334': 'High Definition Video WebM',
	'335': 'Full High Definition Video WebM',
	'337': 'Ultra High Definition Video WebM'
      };
      var ytVideoFound = false;
      var ytVideos = ytVideosContent.split(',');
      var ytVideoParse, ytVideoCodeParse, ytVideoCode, myVideoCode, ytVideo;
      for (var i = 0; i < ytVideos.length; i++) {
	if (!ytVideos[i].match(/^url/)) {
	  ytVideoParse = ytVideos[i].match(/(.*)(url=.*$)/);
	  if (ytVideoParse) ytVideos[i] = ytVideoParse[2] + '&' + ytVideoParse[1];
	}
	ytVideoCodeParse = ytVideos[i].match(/itag=(\d{1,3})/);
	ytVideoCode = (ytVideoCodeParse) ? ytVideoCodeParse[1] : null;
	if (ytVideoCode) {
	  myVideoCode = ytVideoFormats[ytVideoCode];
	  if (myVideoCode) {
	    ytVideo = cleanMyContent(ytVideos[i], true);
	    ytVideo = ytVideo.replace(/url=/, '').replace(/&$/, '');
	    if (ytVideo.match(/itag=/) && ytVideo.match(/itag=/g).length > 1) {
	      if (ytVideo.match(/itag=\d{1,3}&/)) ytVideo = ytVideo.replace(/itag=\d{1,3}&/, '');
	      else if (ytVideo.match(/&itag=\d{1,3}/)) ytVideo = ytVideo.replace(/&itag=\d{1,3}/, '');
	    }
	    if (ytVideo.match(/clen=/) && ytVideo.match(/clen=/g).length > 1) {
	      if (ytVideo.match(/clen=\d+&/)) ytVideo = ytVideo.replace(/clen=\d+&/, '');
	      else if (ytVideo.match(/&clen=\d+/)) ytVideo = ytVideo.replace(/&clen=\d+/, '');
	    }
	    if (ytVideo.match(/lmt=/) && ytVideo.match(/lmt=/g).length > 1) {
	      if (ytVideo.match(/lmt=\d+&/)) ytVideo = ytVideo.replace(/lmt=\d+&/, '');
	      else if (ytVideo.match(/&lmt=\d+/)) ytVideo = ytVideo.replace(/&lmt=\d+/, '');
	    }
	    if (ytVideo.match(/type=(video|audio).*?&/)) ytVideo = ytVideo.replace(/type=(video|audio).*?&/, '');
	    else ytVideo = ytVideo.replace(/&type=(video|audio).*$/, '');
	    if (ytVideo.match(/xtags=[^%=]*&/)) ytVideo = ytVideo.replace(/xtags=[^%=]*?&/, '');
	    else if (ytVideo.match(/&xtags=[^%=]*$/)) ytVideo = ytVideo.replace(/&xtags=[^%=]*$/, '');
	    if (ytVideo.match(/&sig=/)) ytVideo = ytVideo.replace(/&sig=/, '&signature=');
	    else if (ytVideo.match(/&s=/)) {
	      var ytSig = ytVideo.match(/&s=(.*?)(&|$)/);
	      if (ytSig) {
		var s = ytSig[1];
		s = ytDecryptSignature(s);
		if (s) ytVideo = ytVideo.replace(/&s=.*?(&|$)/, '&signature=' + s + '$1');
		else ytVideo = '';
	      }
	      else ytVideo = '';
	    }
	    ytVideo = cleanMyContent(ytVideo, true);
	    if (ytVideo.indexOf('ratebypass') == -1) ytVideo += '&ratebypass=yes';
	    if (ytVideo && ytVideo.indexOf('http') == 0) {
	      if (!ytVideoFound) ytVideoFound = true;
	      ytVideoList[myVideoCode] = ytVideo;
	    }
	  }
	}
      }

      if (ytVideoFound) {
	/* DASH */
	if (!ytVideoList['Standard Definition MP4'] && ytVideoList['Standard Definition Video MP4']) ytVideoList['Standard Definition MP4'] = 'DASH';
	if (!ytVideoList['High Definition MP4'] && ytVideoList['High Definition Video MP4']) ytVideoList['High Definition MP4'] = 'DASH';
	if (!ytVideoList['Full High Definition MP4'] && ytVideoList['Full High Definition Video MP4']) ytVideoList['Full High Definition MP4'] = 'DASH';
	if (!ytVideoList['Ultra High Definition MP4'] && ytVideoList['Ultra High Definition Video MP4']) ytVideoList['Ultra High Definition MP4'] = 'DASH';
	if (!ytVideoList['Standard Definition WebM'] && ytVideoList['Standard Definition Video WebM']) ytVideoList['Standard Definition WebM'] = 'DASH';
	if (!ytVideoList['High Definition WebM'] && ytVideoList['High Definition Video WebM']) ytVideoList['High Definition WebM'] = 'DASH';
	if (!ytVideoList['Full High Definition WebM'] && ytVideoList['Full High Definition Video WebM']) ytVideoList['Full High Definition WebM'] = 'DASH';
	if (!ytVideoList['Ultra High Definition WebM'] && ytVideoList['Ultra High Definition Video WebM']) ytVideoList['Ultra High Definition WebM'] = 'DASH';
	feature['dash'] = true;

	/* DVL */
	ytVideoList['Direct Video Link'] = page.url;
	feature['direct'] = true;

	option['autoget'] = true;
	ytVideosReady = true;
	if (ytPlayerWindow) ytPlayer();
      }
      else {
	if (ytVideosContent.indexOf('conn=rtmp') != -1) showMyMessage('!support');
	else showMyMessage('!videos');
      }
    }

    /* Parse HLS */
    function ytHLS() {
      var ytHLSFormats = {
	'92': 'Very Low Definition MP4',
	'93': 'Low Definition MP4',
	'94': 'Standard Definition MP4',
	'95': 'High Definition MP4',
	'96': 'Full High Definition MP4'
      };
      ytVideoList["Any Definition MP4"] = ytHLSVideos;
      if (ytHLSContent) {
	var ytHLSVideo, ytVideoCodeParse, ytVideoCode, myVideoCode;
	var ytHLSMatcher = new RegExp('(http.*?m3u8)', 'g');
	ytHLSVideos = ytHLSContent.match(ytHLSMatcher);
	if (ytHLSVideos) {
	  for (var i = 0; i < ytHLSVideos.length; i++) {
	    ytHLSVideo = ytHLSVideos[i];
	    ytVideoCodeParse = ytHLSVideo.match(/\/itag\/(\d{1,3})\//);
	    ytVideoCode = (ytVideoCodeParse) ? ytVideoCodeParse[1] : null;
	    if (ytVideoCode) {
	      myVideoCode = ytHLSFormats[ytVideoCode];
	      if (myVideoCode && ytHLSVideo) {
		ytVideoList[myVideoCode] = ytHLSVideo;
	      }
	    }
	  }
	}
      }

      /* DVL */
      ytVideoList['Direct Video Link'] = page.url;
      feature['direct'] = true;

      ytVideoTitle = null;
      ytDefaultVideo = 'Any Definition MP4';
      ytVideosReady = true;
      if (ytPlayerWindow) ytPlayer();
    }

    /* Get Video Thumbnail */
    var ytVideoThumb;
    var ytVideoID = page.url.match(/(\?|&)v=(.*?)(&|$)/);
    if (ytVideoID) ytVideoThumb = 'https://img.youtube.com/vi/' + ytVideoID[2] + '/0.jpg';

    /* Get Video Title */
    var ytVideoTitle = getMyContent(page.url, '"title":"(.*?)"', false);
    if (!ytVideoTitle) ytVideoTitle = getMyContent(page.url, '"videoPrimaryInfoRenderer":\\{"title":\\{"simpleText":"(.*?)"', false);
    if (ytVideoTitle) {
      ytVideoTitle = ytVideoTitle.replace(/&quot;/g, '\'').replace(/&#34;/g, '\'').replace(/"/g, '\'');
      ytVideoTitle = ytVideoTitle.replace(/&#39;/g, '\'').replace(/'/g, '\'');
      ytVideoTitle = ytVideoTitle.replace(/&amp;/g, 'and').replace(/&/g, 'and');
      ytVideoTitle = ytVideoTitle.replace(/\?/g, '').replace(/[#:\*]/g, '-').replace(/\//g, '-');
      ytVideoTitle = ytVideoTitle.replace(/^\s+|\s+$/, '').replace(/\.+$/g, '');
    }

    /* Get Videos Content */
    var ytVideosEncodedFmts, ytVideosAdaptiveFmts, ytVideosContent, ytHLSVideos, ytHLSContent;
    ytVideosEncodedFmts = getMyContent(page.url, '"url_encoded_fmt_stream_map":\\s*"(.*?)"', false);
    if (!ytVideosEncodedFmts) ytVideosEncodedFmts = getMyContent(page.url, '\\\\"url_encoded_fmt_stream_map\\\\":\\s*\\\\"(.*?)\\\\"', false);
    ytVideosAdaptiveFmts = getMyContent(page.url, '"adaptive_fmts":\\s*"(.*?)"', false);
    if (!ytVideosAdaptiveFmts) ytVideosAdaptiveFmts = getMyContent(page.url, '\\\\"adaptive_fmts\\\\":\\s*\\\\"(.*?)\\\\"', false);
    if (!ytVideosAdaptiveFmts) {
      var ytDASHVideos, ytDASHContent;
      ytDASHVideos = getMyContent(page.url, '"dashmpd":\\s*"(.*?)"', false);
      if (!ytDASHVideos) ytDASHVideos = getMyContent(page.url, '\\\\"dashmpd\\\\":\\s*\\\\"(.*?)\\\\"', false);
      if (ytDASHVideos) {
	ytDASHVideos = cleanMyContent(ytDASHVideos, false);
	ytDASHContent = getMyContent(ytDASHVideos + '?pacing=0', 'TEXT', false);
	if (ytDASHContent) {
	  var ytDASHVideo, ytDASHVideoParts, ytDASHVideoServer, ytDASHVideoParams;
	  ytDASHVideos = ytDASHContent.match(new RegExp('<BaseURL>.*?</BaseURL>', 'g'));
	  if (ytDASHVideos) {
	    ytVideosAdaptiveFmts = '';
	    for (var i = 0; i < ytDASHVideos.length; i++) {
	      ytDASHVideo = ytDASHVideos[i].replace('<BaseURL>', '').replace('</BaseURL>', '');
	      if (ytDASHVideo.indexOf('source/youtube') == -1) continue;
	      ytDASHVideoParts = ytDASHVideo.split('videoplayback/');
	      ytDASHVideoServer = ytDASHVideoParts[0] + 'videoplayback?';
	      ytDASHVideoParams = ytDASHVideoParts[1].split('/');
	      ytDASHVideo = '';
	      for (var p = 0; p < ytDASHVideoParams.length; p++) {
		if (p % 2) ytDASHVideo += ytDASHVideoParams[p] + '&';
		else ytDASHVideo += ytDASHVideoParams[p] + '=';
	      }
	      ytDASHVideo = encodeURIComponent(ytDASHVideoServer + ytDASHVideo);
	      ytDASHVideo = ytDASHVideo.replace('itag%3D', 'itag=');
	      ytVideosAdaptiveFmts += ytDASHVideo + ',';
	    }
	  }
	}
      }
    }
    if (ytVideosEncodedFmts) {
      ytVideosContent = ytVideosEncodedFmts;
    }
    else {
      ytHLSVideos = getMyContent(page.url, '"hlsvp":\\s*"(.*?)"', false);
      if (!ytHLSVideos) ytHLSVideos = getMyContent(page.url, '\\\\"hlsvp\\\\":\\s*\\\\"(.*?)\\\\"', false);
      if (!ytHLSVideos) ytHLSVideos = getMyContent(page.url, '\\\\"hlsManifestUrl\\\\":\\s*\\\\"(.*?)\\\\"', false);
      if (ytHLSVideos) {
	ytHLSVideos = cleanMyContent(ytHLSVideos, false);
	if (ytHLSVideos.indexOf('keepalive/yes/') != -1) ytHLSVideos = ytHLSVideos.replace('keepalive/yes/', '');
      }
      else {
	var ytVideoID = page.url.match(/(\?|&)v=(.*?)(&|$)/);
	ytVideoID = (ytVideoID) ? ytVideoID[2] : null;
	if (ytVideoID) {
	  var ytVideoSts = getMyContent(page.url.replace(/watch.*?v=/, 'embed/').replace(/&.*$/, ''), '"sts"\\s*:\\s*(\\d+)', false);
	  var ytVideosInfoURL = page.win.location.protocol + '//' + page.win.location.hostname + '/get_video_info?video_id=' + ytVideoID + '&eurl=https://youtube.googleapis.com/v/' + ytVideoID + '&sts=' + ytVideoSts;
	  var ytVideosInfo = getMyContent(ytVideosInfoURL, 'TEXT', false);
	  if (ytVideosInfo) {
	    ytVideosEncodedFmts = ytVideosInfo.match(/url_encoded_fmt_stream_map=(.*?)&/);
	    ytVideosEncodedFmts = (ytVideosEncodedFmts) ? ytVideosEncodedFmts[1] : null;
	    if (ytVideosEncodedFmts) {
	      ytVideosEncodedFmts = cleanMyContent(ytVideosEncodedFmts, true);
	      ytVideosContent = ytVideosEncodedFmts;
	    }
	    if (!ytVideosAdaptiveFmts) {
	      ytVideosAdaptiveFmts = ytVideosInfo.match(/adaptive_fmts=(.*?)&/);
	      ytVideosAdaptiveFmts = (ytVideosAdaptiveFmts) ? ytVideosAdaptiveFmts[1] : null;
	      if (ytVideosAdaptiveFmts) ytVideosAdaptiveFmts = cleanMyContent(ytVideosAdaptiveFmts, true);
	    }
	  }
	}
      }
    }
    if (ytVideosAdaptiveFmts && !ytHLSVideos) {
      if (ytVideosContent) ytVideosContent += ',' + ytVideosAdaptiveFmts;
      else ytVideosContent = ytVideosAdaptiveFmts;
    }

    /* Get Videos */
    var ytVideoList = {};
    if (ytVideosContent) {
      if (ytVideosContent.match(/&s=/) || ytVideosContent.match(/,s=/) || ytVideosContent.match(/u0026s=/)) {
	var ytScriptURL = getMyContent(page.url, '"js":\\s*"(.*?)"', true);
	if (!ytScriptURL) ytScriptURL = getMyContent(page.url.replace(/watch.*?v=/, 'embed/').replace(/&.*$/, ''), '"js":\\s*"(.*?)"', true);
	if (ytScriptURL) {
	  ytScriptURL = page.win.location.protocol + '//' + page.win.location.hostname + ytScriptURL;
	  ytScriptSrc = getMyContent(ytScriptURL, 'TEXT', false);
	  if (ytScriptSrc) ytDecryptFunction();
	  ytVideos();
	}
	else {
	  showMyMessage('other', 'Couldn\'t get the signature link. Please report it <a href="' + contact + '" style="color:#00892C">here</a>.');
	}
      }
      else {
	ytVideos();
      }
    }
    else {
      if (ytHLSVideos) {
	ytHLSContent = getMyContent(ytHLSVideos, 'TEXT', false);
	ytHLS();
      }
      else {
	showMyMessage('!content');
      }
    }

  }

  // =====YouTube Old===== //

  else if (page.url.indexOf('youtube.com/watch') != -1) {

    /* Redirect Categories */
    if (page.url.indexOf('gaming.youtube.com') != -1) {
      page.win.location.href = page.url.replace('gaming', 'www');
    }

    /* Video Availability */
    var ytVideoUnavailable = getMyElement('', 'div', 'id', 'player-unavailable', -1, false);
    if (ytVideoUnavailable) {
      if (ytVideoUnavailable.className.indexOf('hid') == -1) {
	var ytAgeGateContent = getMyElement('', 'div', 'id', 'watch7-player-age-gate-content', -1, true);
	if (!ytAgeGateContent) return;
	else {
	  if(ytAgeGateContent.indexOf('feature=private_video') != -1) return;
	}
      }
    }

    /* Decrypt Signature */
    var ytScriptSrc;
    function ytDecryptSignature(s) {return null;}
    function ytDecryptFunction() {
      var ytSignFuncName, ytSignFuncBody, ytSwapFuncName, ytSwapFuncBody, ytFuncMatch;
      ytScriptSrc = ytScriptSrc.replace(/(\r\n|\n|\r)/gm, '');
      ytSignFuncName = ytScriptSrc.match(/"signature"\s*,\s*([^\)]*?)\(/);
      if (!ytSignFuncName) ytSignFuncName = ytScriptSrc.match(/d.set\(b,(?:encodeURIComponent\()?.*?([a-zA-Z0-9$]+)\(/);
      ytSignFuncName = (ytSignFuncName) ? ytSignFuncName[1] : null;
      if (ytSignFuncName) {
	ytFuncMatch = ytSignFuncName.replace(/\$/, '\\$') + '\\s*=\\s*function\\s*' + '\\s*\\(\\w+\\)\\s*\\{(.*?)\\}';
	ytSignFuncBody = ytScriptSrc.match(ytFuncMatch);
	ytSignFuncBody = (ytSignFuncBody) ? ytSignFuncBody[1] : null;
	if (ytSignFuncBody) {
	  ytSwapFuncName = ytSignFuncBody.match(/((\$|_|\w)+)\.(\$|_|\w)+\(\w,[0-9]+\)/);
	  ytSwapFuncName = (ytSwapFuncName) ? ytSwapFuncName[1] : null;
	  if (ytSwapFuncName) {
	    ytFuncMatch = 'var\\s+' + ytSwapFuncName.replace(/\$/, '\\$') + '=\\s*\\{(.*?)\\};';
	    ytSwapFuncBody = ytScriptSrc.match(ytFuncMatch);
	    ytSwapFuncBody = (ytSwapFuncBody) ? ytSwapFuncBody[1] : null;
	  }
	  if (ytSwapFuncBody) ytSignFuncBody = 'var ' + ytSwapFuncName + '={' + ytSwapFuncBody + '};' + ytSignFuncBody;
	  ytSignFuncBody = 'try {' + ytSignFuncBody + '} catch(e) {return null}';
	  ytDecryptSignature = new Function('a', ytSignFuncBody);
	}
      }
    }

    /* Player Size */
    var ytSidebarMarginNormal = 382;
    var ytSidebarWindow = getMyElement('', 'div', 'id', 'watch7-sidebar', -1, false);
    if (ytSidebarWindow) {
      var ytSidebarWindowStyle = ytSidebarWindow.currentStyle || window.getComputedStyle(ytSidebarWindow);
      if (ytSidebarWindowStyle) ytSidebarMarginNormal = -12 + parseInt(ytSidebarWindowStyle.marginTop.replace('px', ''));
      styleMyElement(ytSidebarWindow, {marginTop: ytSidebarMarginNormal + 'px'});
    }
    var ytPlayerWidth, ytPlayerHeight;
    var ytPlayerWideWidth, ytPlayerWideHeight;
    var ytSidebarMarginWide;
    var ytScreenWidth, ytScreenHeight;
    function ytSizes() {
      ytScreenWidth = page.win.innerWidth || page.doc.documentElement.clientWidth;
      ytScreenHeight = page.win.innerHeight || page.doc.documentElement.clientHeight;
      if (ytScreenWidth >= 1720 && ytScreenHeight >= 980) {
	ytPlayerWidth = 1280;
	ytPlayerHeight = 742;
	ytPlayerWideWidth = 1706;
	ytPlayerWideHeight = 982;
      }
      else if (ytScreenWidth >= 1294 && ytScreenHeight >= 630) {
	ytPlayerWidth = 854;
	ytPlayerHeight = 502;
	ytPlayerWideWidth = 1280;
	ytPlayerWideHeight = 742;
      }
      else {
	ytPlayerWidth = 640;
	ytPlayerHeight = 382;
	ytPlayerWideWidth = 1066;
	ytPlayerWideHeight = 622;
      }
      ytSidebarMarginWide = ytPlayerHeight + ytSidebarMarginNormal;
    }

    /* Get Player Window */
    var ytPlayerWindow = getMyElement('', 'div', 'id', 'player', -1, false);
    if (!ytPlayerWindow) {
      showMyMessage('!player');
    }
    else {
      /* Get Video Thumbnail */
      var ytVideoThumb;
      var ytVideoID = page.url.match(/(\?|&)v=(.*?)(&|$)/);
      if (ytVideoID) ytVideoThumb = 'https://img.youtube.com/vi/' + ytVideoID[2] + '/0.jpg';

      /* Get Video Title */
      var ytVideoTitle = getMyContent(page.url, 'meta\\s+property="og:title"\\s+content="(.*?)"', false);
      if (!ytVideoTitle) ytVideoTitle = getMyContent(page.url, 'meta\\s+itemprop="name"\\s+content="(.*?)"', false);
      if (ytVideoTitle) {
	ytVideoTitle = ytVideoTitle.replace(/&quot;/g, '\'').replace(/&#34;/g, '\'').replace(/"/g, '\'');
	ytVideoTitle = ytVideoTitle.replace(/&#39;/g, '\'').replace(/'/g, '\'');
	ytVideoTitle = ytVideoTitle.replace(/&amp;/g, 'and').replace(/&/g, 'and');
	ytVideoTitle = ytVideoTitle.replace(/\?/g, '').replace(/[#:\*]/g, '-').replace(/\//g, '-');
	ytVideoTitle = ytVideoTitle.replace(/^\s+|\s+$/, '').replace(/\.+$/g, '');
      }

      /* Get Videos Content */
      var ytVideosEncodedFmts, ytVideosAdaptiveFmts, ytVideosContent, ytHLSVideos, ytHLSContent;
      ytVideosEncodedFmts = getMyContent(page.url, '"url_encoded_fmt_stream_map":\\s*"(.*?)"', false);
      if (!ytVideosEncodedFmts) ytVideosEncodedFmts = getMyContent(page.url, '\\\\"url_encoded_fmt_stream_map\\\\":\\s*\\\\"(.*?)\\\\"', false);
      ytVideosAdaptiveFmts = getMyContent(page.url, '"adaptive_fmts":\\s*"(.*?)"', false);
      if (!ytVideosAdaptiveFmts) ytVideosAdaptiveFmts = getMyContent(page.url, '\\\\"adaptive_fmts\\\\":\\s*\\\\"(.*?)\\\\"', false);
      if (!ytVideosAdaptiveFmts) {
	var ytDASHVideos, ytDASHContent;
	ytDASHVideos = getMyContent(page.url, '"dashmpd":\\s*"(.*?)"', false);
	if (!ytDASHVideos) ytDASHVideos = getMyContent(page.url, '\\\\"dashmpd\\\\":\\s*\\\\"(.*?)\\\\"', false);
	if (ytDASHVideos) {
	  ytDASHVideos = cleanMyContent(ytDASHVideos, false);
	  ytDASHContent = getMyContent(ytDASHVideos + '?pacing=0', 'TEXT', false);
	  if (ytDASHContent) {
	    var ytDASHVideo, ytDASHVideoParts, ytDASHVideoServer, ytDASHVideoParams;
	    ytDASHVideos = ytDASHContent.match(new RegExp('<BaseURL>.*?</BaseURL>', 'g'));
	    if (ytDASHVideos) {
	      ytVideosAdaptiveFmts = '';
	      for (var i = 0; i < ytDASHVideos.length; i++) {
		ytDASHVideo = ytDASHVideos[i].replace('<BaseURL>', '').replace('</BaseURL>', '');
		if (ytDASHVideo.indexOf('source/youtube') == -1) continue;
		ytDASHVideoParts = ytDASHVideo.split('videoplayback/');
		ytDASHVideoServer = ytDASHVideoParts[0] + 'videoplayback?';
		ytDASHVideoParams = ytDASHVideoParts[1].split('/');
		ytDASHVideo = '';
		for (var p = 0; p < ytDASHVideoParams.length; p++) {
		  if (p % 2) ytDASHVideo += ytDASHVideoParams[p] + '&';
		  else ytDASHVideo += ytDASHVideoParams[p] + '=';
		}
		ytDASHVideo = encodeURIComponent(ytDASHVideoServer + ytDASHVideo);
		ytDASHVideo = ytDASHVideo.replace('itag%3D', 'itag=');
		ytVideosAdaptiveFmts += ytDASHVideo + ',';
	      }
	    }
	  }
	}
      }
      if (ytVideosEncodedFmts) {
	ytVideosContent = ytVideosEncodedFmts;
      }
      else {
	ytHLSVideos = getMyContent(page.url, '"hlsvp":\\s*"(.*?)"', false);
	if (!ytHLSVideos) ytHLSVideos = getMyContent(page.url, '\\\\"hlsvp\\\\":\\s*\\\\"(.*?)\\\\"', false);
	if (ytHLSVideos) {
	  ytHLSVideos = cleanMyContent(ytHLSVideos, false);
	  if (ytHLSVideos.indexOf('keepalive/yes/') != -1) ytHLSVideos = ytHLSVideos.replace('keepalive/yes/', '');
	}
	else {
	  var ytVideoID = page.url.match(/(\?|&)v=(.*?)(&|$)/);
	  ytVideoID = (ytVideoID) ? ytVideoID[2] : null;
	  if (ytVideoID) {
	    var ytVideoSts = getMyContent(page.url.replace(/watch.*?v=/, 'embed/').replace(/&.*$/, ''), '"sts"\\s*:\\s*(\\d+)', false);
	    var ytVideosInfoURL = page.win.location.protocol + '//' + page.win.location.hostname + '/get_video_info?video_id=' + ytVideoID + '&eurl=https://youtube.googleapis.com/v/' + ytVideoID + '&sts=' + ytVideoSts;
	    var ytVideosInfo = getMyContent(ytVideosInfoURL, 'TEXT', false);
	    if (ytVideosInfo) {
	      ytVideosEncodedFmts = ytVideosInfo.match(/url_encoded_fmt_stream_map=(.*?)&/);
	      ytVideosEncodedFmts = (ytVideosEncodedFmts) ? ytVideosEncodedFmts[1] : null;
	      if (ytVideosEncodedFmts) {
		ytVideosEncodedFmts = cleanMyContent(ytVideosEncodedFmts, true);
		ytVideosContent = ytVideosEncodedFmts;
	      }
	      if (!ytVideosAdaptiveFmts) {
		ytVideosAdaptiveFmts = ytVideosInfo.match(/adaptive_fmts=(.*?)&/);
		ytVideosAdaptiveFmts = (ytVideosAdaptiveFmts) ? ytVideosAdaptiveFmts[1] : null;
		if (ytVideosAdaptiveFmts) ytVideosAdaptiveFmts = cleanMyContent(ytVideosAdaptiveFmts, true);
	      }
	    }
	  }
	}
      }
      if (ytVideosAdaptiveFmts && !ytHLSVideos) {
	if (ytVideosContent) ytVideosContent += ',' + ytVideosAdaptiveFmts;
	else ytVideosContent = ytVideosAdaptiveFmts;
      }

      /* Get Sizes */
      ytSizes();

      /* Hide Player Window */
      var ytPlaceholderPlayer = getMyElement('', 'div', 'id', 'placeholder-player', -1, false);
      if (ytPlaceholderPlayer) styleMyElement(ytPlaceholderPlayer, {display: 'none'});

      /* Hide Sidebar Ads */
      var ytSidebarAds = getMyElement('', 'div', 'id', 'watch7-sidebar-ads', -1, false);
      if (ytSidebarAds) styleMyElement(ytSidebarAds, {display: 'none'});

      /* Hide Autoplay */
      var ytAutoplay = getMyElement('', 'div', 'class', 'checkbox-on-off', 0, false);
      if (ytAutoplay) styleMyElement(ytAutoplay, {display: 'none'});

      /* Playlist */
      var ytPlaylist = getMyElement('', 'div', 'id', 'player-playlist', -1, false);
      if (ytPlaylist) {
	styleMyElement(ytPlaylist, {marginLeft: '-' + ytPlayerWidth + 'px'});
	var ytPlaceholderPlaylist = getMyElement('', 'div', 'id', 'placeholder-playlist', -1, false);
	if (ytPlaceholderPlaylist) appendMyElement(ytPlaceholderPlaylist, ytPlaylist);
      }

      /* My Player Window */
      myPlayerWindow = createMyElement('div', '', '', '', '');
      styleMyElement(myPlayerWindow, {position: 'relative', width: ytPlayerWidth + 'px', height: ytPlayerHeight + 'px', backgroundColor: '#FFFFFF'});
      modifyMyElement(ytPlayerWindow, 'div', '', false, true);
      appendMyElement(ytPlayerWindow, myPlayerWindow);
      blockObject = ytPlayerWindow;

      /* Update Sizes */
      page.win.addEventListener('resize', function() {
	ytSizes();
	player['playerWidth'] = ytPlayerWidth;
	player['playerHeight'] = ytPlayerHeight;
	player['playerWideWidth'] = ytPlayerWideWidth;
	player['playerWideHeight'] = ytPlayerWideHeight;
	player['sidebarMarginWide'] = ytSidebarMarginWide;
	resizeMyPlayer('widesize');
	if (ytPlaylist) styleMyElement(ytPlaylist, {marginLeft: '-' + ytPlayerWidth + 'px'});
      }, false);

      /* Create Player */
      var ytDefaultVideo = 'Low Definition MP4';
      function ytPlayer() {
	player = {
	  'playerSocket': ytPlayerWindow,
	  'playerWindow': myPlayerWindow,
	  'videoList': ytVideoList,
	  'videoPlay': ytDefaultVideo,
	  'videoThumb': ytVideoThumb,
	  'videoTitle': ytVideoTitle,
	  'playerWidth': ytPlayerWidth,
	  'playerHeight': ytPlayerHeight,
	  'playerWideWidth': ytPlayerWideWidth,
	  'playerWideHeight': ytPlayerWideHeight,
	  'sidebarWindow': ytSidebarWindow,
	  'sidebarMarginNormal': ytSidebarMarginNormal,
	  'sidebarMarginWide': ytSidebarMarginWide
	};
	option['definitions'] = ['Ultra High Definition', 'Full High Definition', 'High Definition', 'Standard Definition', 'Low Definition', 'Very Low Definition'];
	option['containers'] = ['MP4', 'WebM', '3GP', 'Any'];
	createMyPlayer();
      }

      /* Parse Videos */
      function ytVideos() {
	var ytVideoFormats = {
	  '17': 'Very Low Definition 3GP',
	  '18': 'Low Definition MP4',
	  '22': 'High Definition MP4',
	  '36': 'Low Definition 3GP',
	  '43': 'Low Definition WebM',
	  '135': 'Standard Definition Video MP4',
	  '136': 'High Definition Video MP4',
	  '137': 'Full High Definition Video MP4',
	  '140': 'Medium Bitrate Audio MP4',
	  '171': 'Medium Bitrate Audio WebM',
	  '244': 'Standard Definition Video WebM',
	  '247': 'High Definition Video WebM',
	  '248': 'Full High Definition Video WebM',
	  '249': 'Low Bitrate Audio Opus',
	  '250': 'Medium Bitrate Audio Opus',
	  '251': 'High Bitrate Audio Opus',
	  '272': 'Ultra High Definition Video WebM',
	  '298': 'High Definition Video MP4',
	  '299': 'Full High Definition Video MP4',
	  '302': 'High Definition Video WebM',
	  '303': 'Full High Definition Video WebM',
	  '313': 'Ultra High Definition Video WebM',
	  '315': 'Ultra High Definition Video WebM',
	  '333': 'Standard Definition Video WebM',
	  '334': 'High Definition Video WebM',
	  '335': 'Full High Definition Video WebM',
	  '337': 'Ultra High Definition Video WebM'
	};
	var ytVideoFound = false;
	var ytVideos = ytVideosContent.split(',');
	var ytVideoParse, ytVideoCodeParse, ytVideoCode, myVideoCode, ytVideo;
	for (var i = 0; i < ytVideos.length; i++) {
	  if (!ytVideos[i].match(/^url/)) {
	    ytVideoParse = ytVideos[i].match(/(.*)(url=.*$)/);
	    if (ytVideoParse) ytVideos[i] = ytVideoParse[2] + '&' + ytVideoParse[1];
	  }
	  ytVideoCodeParse = ytVideos[i].match(/itag=(\d{1,3})/);
	  ytVideoCode = (ytVideoCodeParse) ? ytVideoCodeParse[1] : null;
	  if (ytVideoCode) {
	    myVideoCode = ytVideoFormats[ytVideoCode];
	    if (myVideoCode) {
	      ytVideo = cleanMyContent(ytVideos[i], true);
	      ytVideo = ytVideo.replace(/url=/, '').replace(/&$/, '');
	      if (ytVideo.match(/itag=/) && ytVideo.match(/itag=/g).length > 1) {
		if (ytVideo.match(/itag=\d{1,3}&/)) ytVideo = ytVideo.replace(/itag=\d{1,3}&/, '');
		else if (ytVideo.match(/&itag=\d{1,3}/)) ytVideo = ytVideo.replace(/&itag=\d{1,3}/, '');
	      }
	      if (ytVideo.match(/clen=/) && ytVideo.match(/clen=/g).length > 1) {
		if (ytVideo.match(/clen=\d+&/)) ytVideo = ytVideo.replace(/clen=\d+&/, '');
		else if (ytVideo.match(/&clen=\d+/)) ytVideo = ytVideo.replace(/&clen=\d+/, '');
	      }
	      if (ytVideo.match(/lmt=/) && ytVideo.match(/lmt=/g).length > 1) {
		if (ytVideo.match(/lmt=\d+&/)) ytVideo = ytVideo.replace(/lmt=\d+&/, '');
		else if (ytVideo.match(/&lmt=\d+/)) ytVideo = ytVideo.replace(/&lmt=\d+/, '');
	      }
	      if (ytVideo.match(/type=(video|audio).*?&/)) ytVideo = ytVideo.replace(/type=(video|audio).*?&/, '');
	      else ytVideo = ytVideo.replace(/&type=(video|audio).*$/, '');
	      if (ytVideo.match(/xtags=[^%=]*&/)) ytVideo = ytVideo.replace(/xtags=[^%=]*?&/, '');
	      else if (ytVideo.match(/&xtags=[^%=]*$/)) ytVideo = ytVideo.replace(/&xtags=[^%=]*$/, '');
	      if (ytVideo.match(/&sig=/)) ytVideo = ytVideo.replace(/&sig=/, '&signature=');
	      else if (ytVideo.match(/&s=/)) {
		var ytSig = ytVideo.match(/&s=(.*?)(&|$)/);
		if (ytSig) {
		  var s = ytSig[1];
		  s = ytDecryptSignature(s);
		  if (s) ytVideo = ytVideo.replace(/&s=.*?(&|$)/, '&signature=' + s + '$1');
		  else ytVideo = '';
		}
		else ytVideo = '';
	      }
	      ytVideo = cleanMyContent(ytVideo, true);
	      if (ytVideo.indexOf('ratebypass') == -1) ytVideo += '&ratebypass=yes';
	      if (ytVideo && ytVideo.indexOf('http') == 0) {
		if (!ytVideoFound) ytVideoFound = true;
		ytVideoList[myVideoCode] = ytVideo;
	      }
	    }
	  }
	}

	if (ytVideoFound) {
	  /* DASH */
	  if (!ytVideoList['Standard Definition MP4'] && ytVideoList['Standard Definition Video MP4']) ytVideoList['Standard Definition MP4'] = 'DASH';
	  if (!ytVideoList['High Definition MP4'] && ytVideoList['High Definition Video MP4']) ytVideoList['High Definition MP4'] = 'DASH';
	  if (!ytVideoList['Full High Definition MP4'] && ytVideoList['Full High Definition Video MP4']) ytVideoList['Full High Definition MP4'] = 'DASH';
	  if (!ytVideoList['Ultra High Definition MP4'] && ytVideoList['Ultra High Definition Video MP4']) ytVideoList['Ultra High Definition MP4'] = 'DASH';
	  if (!ytVideoList['Standard Definition WebM'] && ytVideoList['Standard Definition Video WebM']) ytVideoList['Standard Definition WebM'] = 'DASH';
	  if (!ytVideoList['High Definition WebM'] && ytVideoList['High Definition Video WebM']) ytVideoList['High Definition WebM'] = 'DASH';
	  if (!ytVideoList['Full High Definition WebM'] && ytVideoList['Full High Definition Video WebM']) ytVideoList['Full High Definition WebM'] = 'DASH';
	  if (!ytVideoList['Ultra High Definition WebM'] && ytVideoList['Ultra High Definition Video WebM']) ytVideoList['Ultra High Definition WebM'] = 'DASH';
	  feature['dash'] = true;

	  /* DVL */
	  ytVideoList['Direct Video Link'] = page.url;
	  feature['direct'] = true;

	  option['autoget'] = true;
	  ytPlayer();
	}
	else {
	  if (ytVideosContent.indexOf('conn=rtmp') != -1) showMyMessage('!support');
	  else showMyMessage('!videos');
	}
      }

      /* Parse HLS */
      function ytHLS() {
	var ytHLSFormats = {
	  '92': 'Very Low Definition MP4',
	  '93': 'Low Definition MP4',
	  '94': 'Standard Definition MP4',
	  '95': 'High Definition MP4',
	  '96': 'Full High Definition MP4'
	};
	ytVideoList["Any Definition MP4"] = ytHLSVideos;
	if (ytHLSContent) {
	  var ytHLSVideo, ytVideoCodeParse, ytVideoCode, myVideoCode;
	  var ytHLSMatcher = new RegExp('(http.*?m3u8)', 'g');
	  ytHLSVideos = ytHLSContent.match(ytHLSMatcher);
	  if (ytHLSVideos) {
	    for (var i = 0; i < ytHLSVideos.length; i++) {
	      ytHLSVideo = ytHLSVideos[i];
	      ytVideoCodeParse = ytHLSVideo.match(/\/itag\/(\d{1,3})\//);
	      ytVideoCode = (ytVideoCodeParse) ? ytVideoCodeParse[1] : null;
	      if (ytVideoCode) {
		myVideoCode = ytHLSFormats[ytVideoCode];
		if (myVideoCode && ytHLSVideo) {
		  ytVideoList[myVideoCode] = ytHLSVideo;
		}
	      }
	    }
	  }
	}

	/* DVL */
	ytVideoList['Direct Video Link'] = page.url;
	feature['direct'] = true;

	ytVideoTitle = null;
	ytDefaultVideo = 'Any Definition MP4';
	ytPlayer();
      }

      /* Get Videos */
      var ytVideoList = {};
      if (ytVideosContent) {
	if (ytVideosContent.match(/&s=/) || ytVideosContent.match(/,s=/) || ytVideosContent.match(/u0026s=/)) {
	  var ytScriptURL = getMyContent(page.url, '"js":\\s*"(.*?)"', true);
	  if (!ytScriptURL) ytScriptURL = getMyContent(page.url.replace(/watch.*?v=/, 'embed/').replace(/&.*$/, ''), '"js":\\s*"(.*?)"', true);
	  if (ytScriptURL) {
	    ytScriptURL = page.win.location.protocol + '//' + page.win.location.hostname + ytScriptURL;
	    ytScriptSrc = getMyContent(ytScriptURL, 'TEXT', false);
	    if (ytScriptSrc) ytDecryptFunction();
	    ytVideos();
	  }
	  else {
	    showMyMessage('other', 'Couldn\'t get the signature link. Please report it <a href="' + contact + '" style="color:#00892C">here</a>.');
	  }
	}
	else {
	  ytVideos();
	}
      }
      else {
	if (ytHLSVideos) {
	  ytHLSContent = getMyContent(ytHLSVideos, 'TEXT', false);
	  ytHLS();
	}
	else {
	  showMyMessage('!content');
	}
      }
    }

  }

  // =====Dailymotion===== //

  else if (page.url.indexOf('dailymotion.com/video') != -1) {

    /* Player Sizes */
    var dmPlayerWidth, dmPlayerHeight;
    function dmSizes() {
      if (dmPlayerWindow) dmPlayerWidth = dmPlayerWindow.clientWidth;
      if (dmPlayerWidth) dmPlayerHeight = Math.ceil(dmPlayerWidth / (16 / 9)) + 22;
    }

    /* Resize Event */
    page.win.addEventListener('resize', function() {
      dmSizes();
      player['playerWidth'] = dmPlayerWidth;
      player['playerHeight'] = dmPlayerHeight;
      resizeMyPlayer('widesize');
    }, false);

    /* My Player Window */
    myPlayerWindow = createMyElement('div', '', '', '', '');

    /* Get Objects */
    var dmVideosReady = false;
    var dmPlayerWindow;
    var dmWaitForLoops = 50;
    var dmWaitForObject = page.win.setInterval(function() {
      if (!dmPlayerWindow) dmPlayerWindow = getMyElement('', 'div', 'id', 'player-wrapper', -1, false);
      if (dmPlayerWindow && !myPlayerWindow.parentNode) {
	modifyMyElement(myPlayerWindow, 'div', '', true);
	modifyMyElement(dmPlayerWindow, 'div', '', false, true);
	appendMyElement(dmPlayerWindow, myPlayerWindow);
	blockObject = dmPlayerWindow;
	dmSizes();
	styleMyElement(myPlayerWindow, {position: 'relative', width: dmPlayerWidth + 'px', height: dmPlayerHeight + 'px', backgroundColor: '#FFFFFF'});
	styleMyElement(dmPlayerWindow, {marginTop: '-5px',});
	if (dmVideosReady) dmPlayer();
      }
      dmWaitForLoops--;
      if (dmWaitForLoops == 0) {
	if (!dmPlayerWindow) showMyMessage('!player');
	clearInterval(dmWaitForObject);
      }
      /* Hide Ads */
      var dmAdsTop = getMyElement('', 'div', 'class', 'AdTop__adTop___34Bs9', 0, false);
      if (dmAdsTop && dmAdsTop.parentNode) removeMyElement(dmAdsTop.parentNode, dmAdsTop);
      var dmAdsRightBottom = getMyElement('', 'div', 'class', 'AdWatchingRight__container___3lI6F', 0, false);
      if (dmAdsRightBottom && dmAdsRightBottom.parentNode) removeMyElement(dmAdsRightBottom.parentNode, dmAdsRightBottom);
      var dmAdsRight = getMyElement('', 'div', 'class', 'DiscoveryVideoSection__adCell___1A7ma', 0, false);
      if (dmAdsRight && dmAdsRight.parentNode && dmAdsRight.parentNode.parentNode) removeMyElement(dmAdsRight.parentNode.parentNode, dmAdsRight.parentNode);
    }, 500);
    intervals.push(dmWaitForObject);

    /* Create Player */
    var dmDefaultVideo = 'Low Definition MP4';
    function dmPlayer() {
      player = {
	'playerSocket': dmPlayerWindow,
	'playerWindow': myPlayerWindow,
	'videoList': dmVideoList,
	'videoPlay': dmDefaultVideo,
	'videoThumb': dmVideoThumb,
	'videoTitle': dmVideoTitle,
	'playerWidth': dmPlayerWidth,
	'playerHeight': dmPlayerHeight
      };
      feature['container'] = false;
      feature['widesize'] = false;
      option['definitions'] = ['Full High Definition', 'High Definition', 'Standard Definition', 'Low Definition', 'Very Low Definition'];
      option['containers'] = ['MP4'];
      createMyPlayer();
      /* Fix Panel */
      styleMyElement(player['playerContent'], {marginTop: '7px'});
    }

    /* Get Video Thumbnail */
    var dmVideoThumb = getMyContent(page.url.replace(/\/video\//, "/embed/video/"), '"poster_url":"(.*?)"', false);
    if (dmVideoThumb) dmVideoThumb = cleanMyContent(dmVideoThumb, false);

    /* Get Video Title */
    var dmVideoTitle = getMyContent(page.url.replace(/\/video\//, "/embed/video/"), '"title":"(.*?)"', false);
    if (dmVideoTitle) {
      dmVideoTitle = dmVideoTitle.replace(/&quot;/g, '\'').replace(/&#34;/g, '\'').replace(/"/g, '\'');
      dmVideoTitle = dmVideoTitle.replace(/&#39;/g, '\'').replace(/'/g, '\'');
      dmVideoTitle = dmVideoTitle.replace(/&amp;/g, 'and').replace(/&/g, 'and');
      dmVideoTitle = dmVideoTitle.replace(/\?/g, '').replace(/[#:\*]/g, '-').replace(/\//g, '-');
      dmVideoTitle = dmVideoTitle.replace(/^\s+|\s+$/, '').replace(/\.+$/g, '');
    }

    /* Get Videos Content */
    var dmVideosContent = getMyContent(page.url.replace(/\/video\//, "/embed/video/"), '"qualities":\\{(.*?)\\]\\},', false);

    /* Get Videos */
    var dmVideoList = {};
    if (dmVideosContent) {
      var dmVideoFormats = {'auto': 'Low Definition MP4', '240': 'Very Low Definition MP4', '380': 'Low Definition MP4', '480': 'Standard Definition MP4',
			      '720': 'High Definition MP4', '1080': 'Full High Definition MP4'};
      var dmVideoFound = false;
      var dmVideoParser, dmVideoParse, myVideoCode, dmVideo;
      for (var dmVideoCode in dmVideoFormats) {
	dmVideoParser = '"' + dmVideoCode + '".*?"type":"video.*?mp4","url":"(.*?)"';
	dmVideoParse = dmVideosContent.match(dmVideoParser);
	if (!dmVideoParse) {
	  dmVideoParser = '"' + dmVideoCode + '".*?"type":"application.*?mpegURL","url":"(.*?)"';
	  dmVideoParse = dmVideosContent.match(dmVideoParser);
	}
	dmVideo = (dmVideoParse) ? dmVideoParse[1] : null;
	if (dmVideo) {
	  if (!dmVideoFound) dmVideoFound = true;
	  dmVideo = cleanMyContent(dmVideo, true);
	  myVideoCode = dmVideoFormats[dmVideoCode];
	  if (!dmVideoList[myVideoCode]) dmVideoList[myVideoCode] = dmVideo;
	}
      }

      if (dmVideoFound) {
	/* DVL */
	dmVideoList['Direct Video Link'] = page.url;
	feature['direct'] = true;

	dmVideosReady = true;
	//if (dmPlayerWindow) dmPlayer();
      }
      else {
	showMyMessage('!videos');
      }
    }
    else {
      showMyMessage('!content');
    }

  }

  // =====Vimeo===== //

  else if (page.url.match(/vimeo.com\/\d+/) || page.url.match(/vimeo.com\/channels\/[^\/]*($|\/$|\/page|\/\d+)/) || page.url.match(/vimeo.com\/originals\/[^\/]*($|\/$|\/\d+)/) || page.url.match(/vimeo.com\/album\/\d+\/video\/\d+/) || page.url.match(/vimeo.com\/groups\/[^\/]*\/videos\/\d+/)) {

    /* Multi Video Page */
    if (getMyElement('', 'div', 'class', 'player_container', -1, false).length > 1) return;

    /* Video Page Type */
    var viVideoPage = (page.url.match(/vimeo.com\/\d+/) || page.url.match(/vimeo.com\/album\/\d+\/video\/\d+/) || page.url.match(/vimeo.com\/groups\/[^\/]*\/videos\/\d+/)) ? true : false;

    /* Get Player Window */
    var viPlayerWindow;
    if (viVideoPage) viPlayerWindow = getMyElement('', 'div', 'class', 'player_area', 0, false);
    else viPlayerWindow = getMyElement('', 'div', 'class', 'player_container', 0, false);
    if (!viPlayerWindow) {
      showMyMessage('!player');
    }
    else {
      /* Get Video Thumbnail */
      var viVideoThumb = getMyContent(page.url, 'meta\\s+property="og:image"\\s+content="(.*?)"', false);
      if (!viVideoThumb) viVideoThumb = getMyContent(page.url, 'meta\\s+name="twitter:image"\\s+content="(.*?)"', false);
      if (!viVideoThumb) {
	viVideoThumb = getMyContent(page.url, 'src="(https://i.vimeocdn.com/video/.*?.jpg)"', false);
	if (viVideoThumb) viVideoThumb = viVideoThumb.replace(/_.*/, '_960x540.jpg');
      }

      /* Get Video Title */
      var viVideoTitle = getMyContent(page.url, 'meta\\s+property="og:title"\\s+content="(.*?)"', false);
      if (viVideoTitle) {
	viVideoTitle = viVideoTitle.replace(/&quot;/g, '\'').replace(/&#34;/g, '\'').replace(/"/g, '\'');
	viVideoTitle = viVideoTitle.replace(/&#39;/g, '\'').replace(/'/g, '\'');
	viVideoTitle = viVideoTitle.replace(/&amp;/g, 'and').replace(/&/g, 'and');
	viVideoTitle = viVideoTitle.replace(/\?/g, '').replace(/[#:\*]/g, '-').replace(/\//g, '-');
	viVideoTitle = viVideoTitle.replace(/^\s+|\s+$/, '').replace(/\.+$/g, '');
	viVideoTitle = viVideoTitle.replace(/on\sVimeo$/, '');
      }

      /* Get Content Source */
      var viVideoSource = getMyContent(page.url, '"config_url":"(.*?)"', false);
      if (viVideoSource) viVideoSource = cleanMyContent(viVideoSource, false);
      else viVideoSource = getMyContent(page.url, 'data-config-url="(.*?)"', false).replace(/&amp;/g, '&');

      /* Get Videos Content */
      var viVideosContent;
      if (viVideoSource) {
	viVideosContent = getMyContent(viVideoSource, '"progressive":\\[(.*?)\\]', false);
      }

      /* My Player Window */
      myPlayerWindow = createMyElement('div', '', '', '', '');
      styleMyElement(myPlayerWindow, {position: 'relative', width: '920px', height: '540px', margin: '0px auto', backgroundColor: '#F4F5F7'});
      if (viVideoPage) {
	styleMyElement(viPlayerWindow, {minHeight: '540px', position: 'relative', zIndex: 'auto', transformStyle: 'flat'});
	if (viPlayerWindow.parentNode) styleMyElement(viPlayerWindow.parentNode, {minHeight: '540px', position: 'relative', zIndex: 'auto'});
      }
      else {
	styleMyElement(viPlayerWindow, {height: '100%'});
      }
      modifyMyElement(viPlayerWindow, 'div', '', false, true);
      appendMyElement(viPlayerWindow, myPlayerWindow);
      blockObject = viPlayerWindow;

      /* Get Videos */
      if (viVideosContent) {
	var viVideoFormats = {'1080p': 'Full High Definition MP4', '720p': 'High Definition MP4', '480p': 'Standard Definition MP4', '360p': 'Low Definition MP4', '270p': 'Very Low Definition MP4'};
	var viVideoList = {};
	var viVideoFound = false;
	var viVideo, myVideoCode;
	var viVideos = viVideosContent.split('},');
	for (var i = 0; i < viVideos.length; i++) {
	  for (var viVideoCode in viVideoFormats) {
	    if (viVideos[i].indexOf('"quality":"' + viVideoCode + '"') != -1) {
	      viVideo = viVideos[i].match(/"url":"(.*?)"/);
	      viVideo = (viVideo) ? viVideo[1] : null;
	      if (viVideo) {
		if (!viVideoFound) viVideoFound = true;
		myVideoCode = viVideoFormats[viVideoCode];
		viVideoList[myVideoCode] = viVideo;
	      }
	    }
	  }
	}

	/* Channels Sidebar */
	if (page.url.indexOf('/channels') != -1 && page.url.indexOf('/channels/staffpicks') == -1) {
	  var viSidebar = getMyElement('', 'div', 'class', 'col_small', 0, false);
	  if (viSidebar) {
	    styleMyElement(viSidebar, {marginTop: '570px'});
	    styleMyElement(viPlayerWindow, {paddingBottom: '10px'});
	  }
	}

	if (viVideoFound) {
	  /* DVL */
	  viVideoList['Direct Video Link'] = page.url;
	  feature['direct'] = true;

	  /* Create Player */
	  var viDefaultVideo = 'Low Definition MP4';
	  player = {
	    'playerSocket': viPlayerWindow,
	    'playerWindow': myPlayerWindow,
	    'videoList': viVideoList,
	    'videoPlay': viDefaultVideo,
	    'videoThumb': viVideoThumb,
	    'videoTitle' : viVideoTitle,
	    'playerWidth': 920,
	    'playerHeight': 540
	  };
	  feature['container'] = false;
	  feature['widesize'] = false;
	  option['definitions'] = ['High Definition', 'Standard Definition', 'Low Definition', 'Very Low Definition'];
	  option['containers'] = ['MP4'];
	  createMyPlayer();

	  /* Fix panel */
	  styleMyElement(player['playerContent'], {marginTop: '7px'});
	}
	else {
	  showMyMessage('!videos');
	}
      }
      else {
	showMyMessage('!content');
      }
    }

  }

  // =====Metacafe===== //

  else if (page.url.indexOf('metacafe.com/watch') != -1) {

    /* Get Player Window */
    mcPlayerWindow = getMyElement('', 'div', 'class', 'mc-player-wrap', 0, false);
    if (!mcPlayerWindow) {
      showMyMessage('!player');
    }
    else {
      /* Get Video Thumbnail */
      var mcVideoThumb = getMyContent(page.url, '"preview":"(.*?)"', false);
      if (mcVideoThumb) mcVideoThumb = cleanMyContent(mcVideoThumb, false);

      /* Get Videos Content */
      var mcVideosContent = getMyContent(page.url, 'flashvars\\s*=\\s*\\{(.*?)\\};', false);

      /* Player Size */
      var mcPlayerWidth, mcPlayerHeight;
      function mcGetSizes() {
	mcPlayerWidth = mcPlayerWindow.clientWidth;
	mcPlayerHeight = Math.ceil(mcPlayerWidth / (16 / 9)) + 22;
      }
      function mcUpdateSizes() {
	mcGetSizes();
	player['playerWidth'] = mcPlayerWidth;
	player['playerHeight'] = mcPlayerHeight;
	resizeMyPlayer('widesize');
      }
      mcGetSizes();

      /* My Player Window */
      myPlayerWindow = createMyElement('div', '', '', '', '');
      styleMyElement(myPlayerWindow, {position: 'relative', width: mcPlayerWidth + 'px', height: mcPlayerHeight + 'px', backgroundColor: '#F4F4F4'});
      modifyMyElement(mcPlayerWindow, 'div', '', false, true);
      appendMyElement(mcPlayerWindow, myPlayerWindow);
      blockObject = mcPlayerWindow;

      /* Resize Event */
      page.win.addEventListener('resize', mcUpdateSizes, false);

      /* Hide Ads */
      var mcTopAd = getMyElement('', 'div', 'class', 'mc-action', 0, false);
      if (mcTopAd && mcTopAd.parentNode) removeMyElement(mcTopAd.parentNode, mcTopAd);
      var mcRightAd = getMyElement('', 'div', 'class', 'mc-action', 1, false);
      if (mcRightAd && mcRightAd.parentNode) removeMyElement(mcRightAd.parentNode, mcRightAd);

      /* Get Videos */
      if (mcVideosContent) {
	var mcVideoList = {};
	var mcVideoFound = false;
	var mcVideoFormats = {'video_alt_url2': 'High Definition MP4', 'video_alt_url': 'Low Definition MP4', 'video_url': 'Very Low Definition MP4'};
	var mcVideoFormatz = {'video_alt_url2': '_720p', 'video_alt_url': '_360p', 'video_url': '_240p'};
	var mcVideoHLS = mcVideosContent.match(/"src":"(.*?)"/);
	mcVideoHLS = (mcVideoHLS) ? cleanMyContent(mcVideoHLS[1], false) : null;
	if (mcVideoHLS) {
	  var mcVideoParser, mcVideoParse, myVideoCode, mcVideo;
	  for (var mcVideoCode in mcVideoFormats) {
	    mcVideoParser = '"' + mcVideoCode + '":"(.*?)"';
	    mcVideoParse = mcVideosContent.match(mcVideoParser);
	    mcVideo = (mcVideoParse) ? mcVideoParse[1] : null;
	    if (mcVideo) {
	      if (!mcVideoFound) mcVideoFound = true;
	      myVideoCode = mcVideoFormats[mcVideoCode];
	      mcVideoList[myVideoCode] = mcVideoHLS.replace('.m3u8', mcVideoFormatz[mcVideoCode] + '.m3u8');
	    }
	  }
	}

	if (mcVideoFound) {
	  /* Create Player */
	  var mcDefaultVideo = 'Low Definition MP4';
	  player = {
	    'playerSocket': mcPlayerWindow,
	    'playerWindow': myPlayerWindow,
	    'videoList': mcVideoList,
	    'videoPlay': mcDefaultVideo,
	    'videoThumb': mcVideoThumb,
	    'playerWidth': mcPlayerWidth,
	    'playerHeight': mcPlayerHeight
	  };
	  feature['container'] = false;
	  feature['widesize'] = false;
	  option['definitions'] = ['High Definition', 'Low Definition', 'Very Low Definition'];
	  option['containers'] = ['MP4'];
	  createMyPlayer();

	  /* Fix panel */
	  styleMyElement(player['playerContent'], {marginTop: '3px'});
	}
	else {
	  showMyMessage('!videos');
	}
      }
      else {
	var ytVideoId = page.url.match(/\/yt-(.*?)\//);
	if (ytVideoId && ytVideoId[1]) {
	  var ytVideoLink = 'http://youtube.com/watch?v=' + ytVideoId[1];
	  showMyMessage('embed', ytVideoLink);
	}
	else {
	  showMyMessage('!content');
	}
      }
    }

  }

  // =====Veoh===== //

  else if (page.url.indexOf('veoh.com/watch') != -1) {

    /* Get Video Availability */
    if (getMyElement('', 'div', 'class', 'veoh-video-player-error', 0, false)) return;

    /* Get Player Window */
    var vePlayerWindow = getMyElement('', 'div', 'id', 'videoPlayerContainer', -1, false);
    if (!vePlayerWindow) {
      showMyMessage('!player');
    }
    else {
      /* Get Videos Content */
      var veVideosContent = getMyContent(page.url, '__watch.videoDetailsJSON = \'\\{(.*?)\\}', false);
      veVideosContent = cleanMyContent(veVideosContent, true);

      /* Get Video Thumbnail */
      var veVideoThumbGet = veVideosContent.match(/"highResImage":"(.*?)"/);
      var veVideoThumb = (veVideoThumbGet) ? veVideoThumbGet[1] : null;

      /* Get Video Title */
      var veVideoTitle = getMyContent(page.url, 'meta\\s+name="og:title"\\s+content="(.*?)"', false);
      if (veVideoTitle) {
	veVideoTitle = veVideoTitle.replace(/&quot;/g, '\'').replace(/&#34;/g, '\'').replace(/"/g, '\'');
	veVideoTitle = veVideoTitle.replace(/&#39;/g, '\'').replace(/'/g, '\'');
	veVideoTitle = veVideoTitle.replace(/&amp;/g, 'and').replace(/&/g, 'and');
	veVideoTitle = veVideoTitle.replace(/\?/g, '').replace(/[#:\*]/g, '-').replace(/\//g, '-');
	veVideoTitle = veVideoTitle.replace(/^\s+|\s+$/, '').replace(/\.+$/g, '');
      }

      /* My Player Window */
      myPlayerWindow = createMyElement('div', '', '', '', '');
      styleMyElement(myPlayerWindow, {position: 'relative', width: '640px', height: '382px', backgroundColor: '#F4F4F4'});
      modifyMyElement(vePlayerWindow, 'div', '', true);
      styleMyElement(vePlayerWindow, {height: '100%'});
      appendMyElement(vePlayerWindow, myPlayerWindow);

      /* Get Videos */
      if (veVideosContent) {
	var veVideoFormats = {'fullPreviewHashLowPath': 'Very Low Definition MP4', 'fullPreviewHashHighPath': 'Low Definition MP4'};
	var veVideoList = {};
	var veVideoFound = false;
	var veVideoParser, veVideoParse, veVideo, myVideoCode;
	for (var veVideoCode in veVideoFormats) {
	  veVideoParser = veVideoCode + '":"(.*?)"';
	  veVideoParse = veVideosContent.match(veVideoParser);
	  veVideo = (veVideoParse) ? veVideoParse[1] : null;
	  if (veVideo) {
	    if (!veVideoFound) veVideoFound = true;
	    myVideoCode = veVideoFormats[veVideoCode];
	    veVideoList[myVideoCode] = veVideo;
	  }
	}

	if (veVideoFound) {
	  /* Get Watch Sidebar */
	  var veSidebarWindow = getMyElement('', 'div', 'id', 'videoToolsContainer', -1, false);
	  if (veSidebarWindow) styleMyElement(veSidebarWindow, {marginTop: '-380px'});

	  /* Create Player */
	  var veDefaultVideo = 'Low Definition MP4';
	  player = {
	    'playerSocket': vePlayerWindow,
	    'playerWindow': myPlayerWindow,
	    'videoList': veVideoList,
	    'videoPlay': veDefaultVideo,
	    'videoThumb': veVideoThumb,
	    'videoTitle' : veVideoTitle,
	    'playerWidth': 640,
	    'playerHeight': 382,
	    'playerWideWidth': 970,
	    'playerWideHeight': 568,
	    'sidebarWindow': veSidebarWindow,
	    'sidebarMarginNormal': -380,
	    'sidebarMarginWide': 20
	  };
	  feature['container'] = false;
	  option['definition'] = 'LD';
	  option['definitions'] = ['Low Definition', 'Very Low Definition'];
	  option['containers'] = ['MP4'];
	  createMyPlayer();
	}
	else {
	  var ytVideoId = getMyContent(page.url, 'youtube.com/embed/(.*?)("|\\?)', false);
	  if (!ytVideoId) ytVideoId = getMyContent(page.url, '"videoId":"yapi-(.*?)"', false);
	  if (ytVideoId) {
	    var ytVideoLink = 'http://youtube.com/watch?v=' + ytVideoId;
	    showMyMessage('embed', ytVideoLink);
	  }
	  else {
	    showMyMessage('!videos');
	  }
	}
      }
      else {
	showMyMessage('!content');
      }
    }

  }

  // =====Viki===== //

  else if (page.url.indexOf('viki.com/videos') != -1) {

    /* Get Player Window */
    var vkPlayerWindow = getMyElement('', 'div', 'class', 'video-column', 0, false);
    if (!vkPlayerWindow) {
      showMyMessage('!player');
    }
    else {
      /* Get Video Thumbnail */
      var vkVideoThumb = getMyContent(page.url, 'meta\\s+property="og:image"\\s+content="(.*?)"', false);
      if (vkVideoThumb) vkVideoThumb = vkVideoThumb.replace(/&amp;/g, '&');

      /* Get Video Title */
      var vkVideoTitle = getMyContent(page.url, 'meta\\s+property="og:title"\\s+content="(.*?)"', false);
      if (vkVideoTitle) {
	vkVideoTitle = vkVideoTitle.replace(/&quot;/g, '\'').replace(/&#34;/g, '\'').replace(/"/g, '\'');
	vkVideoTitle = vkVideoTitle.replace(/&#39;/g, '\'').replace(/'/g, '\'');
	vkVideoTitle = vkVideoTitle.replace(/&amp;/g, 'and').replace(/&/g, 'and');
	vkVideoTitle = vkVideoTitle.replace(/\?/g, '').replace(/[#:\*]/g, '-').replace(/\//g, '-');
	vkVideoTitle = vkVideoTitle.replace(/^\s+|\s+$/, '').replace(/\.+$/g, '');
      }

      /* Get Video ID */
      var vkVideoID = page.url.match(/videos\/(\d+v)/);
      vkVideoID = (vkVideoID) ? vkVideoID[1] : null;

      /* Get Videos Content */
      var vkVideosContent;
      if (vkVideoID) {
	/*
	A JavaScript implementation of the SHA family of hashes, as
	defined in FIPS PUB 180-4 and FIPS PUB 202, as well as the corresponding
	HMAC implementation as defined in FIPS PUB 198a

	Copyright Brian Turek 2008-2017
	Distributed under the BSD License
	See http://caligatio.github.com/jsSHA/ for more information

	Several functions taken from Paul Johnston
	*/
	'use strict';(function(G){function r(d,b,c){var h=0,a=[],f=0,g,m,k,e,l,p,q,t,w=!1,n=[],u=[],v,r=!1;c=c||{};g=c.encoding||"UTF8";v=c.numRounds||1;if(v!==parseInt(v,10)||1>v)throw Error("numRounds must a integer >= 1");if("SHA-1"===d)l=512,p=z,q=H,e=160,t=function(a){return a.slice()};else throw Error("Chosen SHA variant is not supported");k=A(b,g);m=x(d);this.setHMACKey=function(a,f,b){var c;if(!0===w)throw Error("HMAC key already set");if(!0===r)throw Error("Cannot set HMAC key after calling update");
	g=(b||{}).encoding||"UTF8";f=A(f,g)(a);a=f.binLen;f=f.value;c=l>>>3;b=c/4-1;if(c<a/8){for(f=q(f,a,0,x(d),e);f.length<=b;)f.push(0);f[b]&=4294967040}else if(c>a/8){for(;f.length<=b;)f.push(0);f[b]&=4294967040}for(a=0;a<=b;a+=1)n[a]=f[a]^909522486,u[a]=f[a]^1549556828;m=p(n,m);h=l;w=!0};this.update=function(b){var e,g,c,d=0,q=l>>>5;e=k(b,a,f);b=e.binLen;g=e.value;e=b>>>5;for(c=0;c<e;c+=q)d+l<=b&&(m=p(g.slice(c,c+q),m),d+=l);h+=d;a=g.slice(d>>>5);f=b%l;r=!0};this.getHash=function(b,g){var c,k,l,p;if(!0===
	w)throw Error("Cannot call getHash after setting HMAC key");l=B(g);switch(b){case "HEX":c=function(a){return C(a,e,l)};break;case "B64":c=function(a){return D(a,e,l)};break;case "BYTES":c=function(a){return E(a,e)};break;case "ARRAYBUFFER":try{k=new ArrayBuffer(0)}catch(I){throw Error("ARRAYBUFFER not supported by this environment");}c=function(a){return F(a,e)};break;default:throw Error("format must be HEX, B64, BYTES, or ARRAYBUFFER");}p=q(a.slice(),f,h,t(m),e);for(k=1;k<v;k+=1)p=q(p,e,0,x(d),e);
	return c(p)};this.getHMAC=function(b,g){var c,k,n,r;if(!1===w)throw Error("Cannot call getHMAC without first setting HMAC key");n=B(g);switch(b){case "HEX":c=function(a){return C(a,e,n)};break;case "B64":c=function(a){return D(a,e,n)};break;case "BYTES":c=function(a){return E(a,e)};break;case "ARRAYBUFFER":try{c=new ArrayBuffer(0)}catch(I){throw Error("ARRAYBUFFER not supported by this environment");}c=function(a){return F(a,e)};break;default:throw Error("outputFormat must be HEX, B64, BYTES, or ARRAYBUFFER");
	}k=q(a.slice(),f,h,t(m),e);r=p(u,x(d));r=q(k,e,l,r,e);return c(r)}}function C(d,b,c){var h="";b/=8;var a,f;for(a=0;a<b;a+=1)f=d[a>>>2]>>>8*(3+a%4*-1),h+="0123456789abcdef".charAt(f>>>4&15)+"0123456789abcdef".charAt(f&15);return c.outputUpper?h.toUpperCase():h}function D(d,b,c){var h="",a=b/8,f,g,m;for(f=0;f<a;f+=3)for(g=f+1<a?d[f+1>>>2]:0,m=f+2<a?d[f+2>>>2]:0,m=(d[f>>>2]>>>8*(3+f%4*-1)&255)<<16|(g>>>8*(3+(f+1)%4*-1)&255)<<8|m>>>8*(3+(f+2)%4*-1)&255,g=0;4>g;g+=1)8*f+6*g<=b?h+="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(m>>>
	6*(3-g)&63):h+=c.b64Pad;return h}function E(d,b){var c="",h=b/8,a,f;for(a=0;a<h;a+=1)f=d[a>>>2]>>>8*(3+a%4*-1)&255,c+=String.fromCharCode(f);return c}function F(d,b){var c=b/8,h,a=new ArrayBuffer(c),f;f=new Uint8Array(a);for(h=0;h<c;h+=1)f[h]=d[h>>>2]>>>8*(3+h%4*-1)&255;return a}function B(d){var b={outputUpper:!1,b64Pad:"=",shakeLen:-1};d=d||{};b.outputUpper=d.outputUpper||!1;!0===d.hasOwnProperty("b64Pad")&&(b.b64Pad=d.b64Pad);if("boolean"!==typeof b.outputUpper)throw Error("Invalid outputUpper formatting option");
	if("string"!==typeof b.b64Pad)throw Error("Invalid b64Pad formatting option");return b}function A(d,b){var c;switch(b){case "UTF8":case "UTF16BE":case "UTF16LE":break;default:throw Error("encoding must be UTF8, UTF16BE, or UTF16LE");}switch(d){case "HEX":c=function(b,a,f){var g=b.length,c,d,e,l,p;if(0!==g%2)throw Error("String of HEX type must be in byte increments");a=a||[0];f=f||0;p=f>>>3;for(c=0;c<g;c+=2){d=parseInt(b.substr(c,2),16);if(isNaN(d))throw Error("String of HEX type contains invalid characters");
	l=(c>>>1)+p;for(e=l>>>2;a.length<=e;)a.push(0);a[e]|=d<<8*(3+l%4*-1)}return{value:a,binLen:4*g+f}};break;case "TEXT":c=function(c,a,f){var g,d,k=0,e,l,p,q,t,n;a=a||[0];f=f||0;p=f>>>3;if("UTF8"===b)for(n=3,e=0;e<c.length;e+=1)for(g=c.charCodeAt(e),d=[],128>g?d.push(g):2048>g?(d.push(192|g>>>6),d.push(128|g&63)):55296>g||57344<=g?d.push(224|g>>>12,128|g>>>6&63,128|g&63):(e+=1,g=65536+((g&1023)<<10|c.charCodeAt(e)&1023),d.push(240|g>>>18,128|g>>>12&63,128|g>>>6&63,128|g&63)),l=0;l<d.length;l+=1){t=k+
	p;for(q=t>>>2;a.length<=q;)a.push(0);a[q]|=d[l]<<8*(n+t%4*-1);k+=1}else if("UTF16BE"===b||"UTF16LE"===b)for(n=2,d="UTF16LE"===b&&!0||"UTF16LE"!==b&&!1,e=0;e<c.length;e+=1){g=c.charCodeAt(e);!0===d&&(l=g&255,g=l<<8|g>>>8);t=k+p;for(q=t>>>2;a.length<=q;)a.push(0);a[q]|=g<<8*(n+t%4*-1);k+=2}return{value:a,binLen:8*k+f}};break;case "B64":c=function(b,a,f){var c=0,d,k,e,l,p,q,n;if(-1===b.search(/^[a-zA-Z0-9=+\/]+$/))throw Error("Invalid character in base-64 string");k=b.indexOf("=");b=b.replace(/\=/g,
	"");if(-1!==k&&k<b.length)throw Error("Invalid '=' found in base-64 string");a=a||[0];f=f||0;q=f>>>3;for(k=0;k<b.length;k+=4){p=b.substr(k,4);for(e=l=0;e<p.length;e+=1)d="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".indexOf(p[e]),l|=d<<18-6*e;for(e=0;e<p.length-1;e+=1){n=c+q;for(d=n>>>2;a.length<=d;)a.push(0);a[d]|=(l>>>16-8*e&255)<<8*(3+n%4*-1);c+=1}}return{value:a,binLen:8*c+f}};break;case "BYTES":c=function(b,a,c){var d,m,k,e,l;a=a||[0];c=c||0;k=c>>>3;for(m=0;m<b.length;m+=
	1)d=b.charCodeAt(m),l=m+k,e=l>>>2,a.length<=e&&a.push(0),a[e]|=d<<8*(3+l%4*-1);return{value:a,binLen:8*b.length+c}};break;case "ARRAYBUFFER":try{c=new ArrayBuffer(0)}catch(h){throw Error("ARRAYBUFFER not supported by this environment");}c=function(b,a,c){var d,m,k,e,l;a=a||[0];c=c||0;m=c>>>3;l=new Uint8Array(b);for(d=0;d<b.byteLength;d+=1)e=d+m,k=e>>>2,a.length<=k&&a.push(0),a[k]|=l[d]<<8*(3+e%4*-1);return{value:a,binLen:8*b.byteLength+c}};break;default:throw Error("format must be HEX, TEXT, B64, BYTES, or ARRAYBUFFER");
	}return c}function n(d,b){return d<<b|d>>>32-b}function u(d,b){var c=(d&65535)+(b&65535);return((d>>>16)+(b>>>16)+(c>>>16)&65535)<<16|c&65535}function y(d,b,c,h,a){var f=(d&65535)+(b&65535)+(c&65535)+(h&65535)+(a&65535);return((d>>>16)+(b>>>16)+(c>>>16)+(h>>>16)+(a>>>16)+(f>>>16)&65535)<<16|f&65535}function x(d){var b=[];if("SHA-1"===d)b=[1732584193,4023233417,2562383102,271733878,3285377520];else throw Error("No SHA variants supported");return b}function z(d,b){var c=[],h,a,f,g,m,k,e;h=b[0];a=b[1];
	f=b[2];g=b[3];m=b[4];for(e=0;80>e;e+=1)c[e]=16>e?d[e]:n(c[e-3]^c[e-8]^c[e-14]^c[e-16],1),k=20>e?y(n(h,5),a&f^~a&g,m,1518500249,c[e]):40>e?y(n(h,5),a^f^g,m,1859775393,c[e]):60>e?y(n(h,5),a&f^a&g^f&g,m,2400959708,c[e]):y(n(h,5),a^f^g,m,3395469782,c[e]),m=g,g=f,f=n(a,30),a=h,h=k;b[0]=u(h,b[0]);b[1]=u(a,b[1]);b[2]=u(f,b[2]);b[3]=u(g,b[3]);b[4]=u(m,b[4]);return b}function H(d,b,c,h){var a;for(a=(b+65>>>9<<4)+15;d.length<=a;)d.push(0);d[b>>>5]|=128<<24-b%32;b+=c;d[a]=b&4294967295;d[a-1]=b/4294967296|0;
	b=d.length;for(a=0;a<b;a+=16)h=z(d.slice(a,a+16),h);return h}"function"===typeof define&&define.amd?define(function(){return r}):"undefined"!==typeof exports?("undefined"!==typeof module&&module.exports&&(module.exports=r),exports=r):G.jsSHA=r})(this);

	var vkTimestamp = parseInt(Date.now() / 1000);
	var vkQuery = "/v5/videos/" + vkVideoID + "/streams.json?app=100005a&t=" + vkTimestamp + "&site=www.viki.com"
	var vkToken = "MM_d*yP@`&1@]@!AVrXf_o-HVEnoTnm$O-ti4[G~$JDI/Dc-&piU&z&5.;:}95\=Iad";
	var shaObj = new jsSHA("SHA-1", "TEXT");
	shaObj.setHMACKey(vkToken, "TEXT");
	shaObj.update(vkQuery);
	var vkSig = shaObj.getHMAC("HEX");
	var vkSource = "https://api.viki.io" + vkQuery + "&sig=" + vkSig;
	vkVideosContent = getMyContent(vkSource, 'TEXT', false);
      }

      /* Player Size */
      var vkPlayerWidth, vkPlayerHeight;
      function vkGetSizes() {
	vkPlayerWidth = vkPlayerWindow.clientWidth - 17;
	vkPlayerHeight = Math.ceil(vkPlayerWidth / (16 / 9)) + 22;
      }
      function vkUpdateSizes() {
	vkGetSizes();
	player['playerWidth'] = vkPlayerWidth;
	player['playerHeight'] = vkPlayerHeight;
	resizeMyPlayer('widesize');
      }
      vkGetSizes();

      /* My Player Window */
      myPlayerWindow = createMyElement('div', '', '', '', '');
      styleMyElement(myPlayerWindow, {position: 'relative', width: vkPlayerWidth + 'px', height: vkPlayerHeight + 'px', backgroundColor: '#FFFFFF'});
      modifyMyElement(vkPlayerWindow, 'div', '', false, true);
      styleMyElement(vkPlayerWindow, {marginBottom: '10px'});
      appendMyElement(vkPlayerWindow, myPlayerWindow);
      blockObject = vkPlayerWindow;

      /* Resize Event */
      page.win.addEventListener('resize', vkUpdateSizes, false);

      /* Get Videos */
      if (vkVideosContent) {
	var vkVideoList = {};
	var vkVideoFormats = {'720p': 'High Definition MP4', '480p': 'Standard Definition MP4', '360p': 'Low Definition MP4', '240p': 'Very Low Definition MP4'};
	var vkVideoFound = false;
	var vkVideoParser, vkVideoParse, vkVideo, myVideoCode;
	for (var vkVideoCode in vkVideoFormats) {
	  vkVideoParser = '"' + vkVideoCode + '".*?"https":\{"url":"(.*?)"';
	  vkVideoParse = vkVideosContent.match(vkVideoParser);
	  vkVideo = (vkVideoParse) ? vkVideoParse[1] : null;
	  if (vkVideo) {
	    if (!vkVideoFound) vkVideoFound = true;
	    myVideoCode = vkVideoFormats[vkVideoCode];
	    vkVideoList[myVideoCode] = vkVideo;
	  }
	}

	/* Create Player */
	if (vkVideoFound) {
	  var vkDefaultVideo = 'Low Definition MP4';
	  player = {
	    'playerSocket': vkPlayerWindow,
	    'playerWindow': myPlayerWindow,
	    'videoList': vkVideoList,
	    'videoPlay': vkDefaultVideo,
	    'videoThumb': vkVideoThumb,
	    'videoTitle' : vkVideoTitle,
	    'playerWidth': vkPlayerWidth,
	    'playerHeight': vkPlayerHeight,
	  };
	  feature['container'] = false;
	  feature['widesize'] = false;
	  option['definition'] = 'LD';
	  option['definitions'] = ['High Definition', 'Standard Definition', 'Low Definition', 'Very Low Definition'];
	  option['containers'] = ['MP4'];
	  createMyPlayer();
	  vkUpdateSizes();

	  /* Fix panel */
	  styleMyElement(player['playerContent'], {marginTop: '5px'});
	}
	else {
	  if (vkVideosContent.indexOf('unauth') != -1) showMyMessage('other', 'Authorization required!');
	  else showMyMessage('!videos');
	}
      }
      else {
	showMyMessage('!content');
      }
    }

  }

  // =====IMDB===== //

  else if (page.url.indexOf('imdb.com') != -1) {

    /* Redirect To Video Page */
    if (page.url.indexOf('/video/') == -1 && page.url.indexOf('/videoplayer/') == -1) {
      page.doc.addEventListener('click', function(e) {
	var p = e.target.parentNode;
	while (p) {
	  if (p.tagName === 'A' && p.href.indexOf('/video/imdb') != -1) {
	    page.win.location.href = p.href.replace(/imdb\/inline.*/, '');
	  }
	  p = p.parentNode;
	}
      }, false);
      return;
    }

    /* Player Sizea */
    var imdbPlayerWidth, imdbPlayerHeight;
    function imdbSizes() {
      if (imdbPlayerWindow) imdbPlayerWidth = imdbPlayerWindow.clientWidth;
      if (imdbPlayerWidth) imdbPlayerHeight = Math.ceil(imdbPlayerWidth / (16 / 9)) + 22;
    }

    /* Resize Event */
    page.win.addEventListener('resize', function() {
      imdbSizes();
      player['playerWidth'] = imdbPlayerWidth;
      player['playerHeight'] = imdbPlayerHeight;
      resizeMyPlayer('widesize');
    }, false);

    /* My Player Window */
    myPlayerWindow = createMyElement('div', '', '', '', '');

    /* Get Objects */
    var imdbVideosReady = false;
    var imdbPlayerWindow, imdbVideoWindow;
    var imdbWaitForLoops = 50;
    var imdbWaitForObject = page.win.setInterval(function() {
      if (!imdbPlayerWindow) {
	imdbPlayerWindow = getMyElement('', 'div', 'class', 'video-player__video-container', 0, false);
	if (!imdbPlayerWindow) imdbPlayerWindow = getMyElement('', 'div', 'id', 'video-container', -1, false);
	if (imdbPlayerWindow) {
	  modifyMyElement(imdbPlayerWindow, 'div', '', false, true);
	  appendMyElement(imdbPlayerWindow, myPlayerWindow);
	  blockObject = imdbPlayerWindow;
	  imdbSizes();
	  styleMyElement(myPlayerWindow, {width: imdbPlayerWidth + 'px', height: imdbPlayerHeight + 'px', backgroundColor: '#FFFFFF'});
	  if (imdbVideosReady) imdbPlayer();
	}
      }
      imdbVideoWindow = getMyElement('', 'div', 'class', 'video-player__video', 0, false);
      if (imdbVideoWindow) styleMyElement(imdbVideoWindow, {display: 'none'});
      ytWaitForLoops--;
      if (ytWaitForLoops == 0) {
	if (!imdbPlayerWindow) showMyMessage('!player');
	clearInterval(imdbWaitForObject);
      }
    }, 500);
    intervals.push(imdbWaitForObject);

    /* Create Player */
    var imdbDefaultVideo = 'Low Definition MP4';
    function imdbPlayer() {
      player = {
	'playerSocket': imdbPlayerWindow,
	'playerWindow': myPlayerWindow,
	'videoList': imdbVideoList,
	'videoPlay': imdbDefaultVideo,
	'videoThumb': imdbVideoThumb,
	'videoTitle' : imdbVideoTitle,
	'playerWidth': imdbPlayerWidth,
	'playerHeight': imdbPlayerHeight
      };
      feature['container'] = false;
      feature['widesize'] = false;
      option['definitions'] = ['Full High Definition', 'High Definition', 'Standard Definition', 'Low Definition', 'Very Low Definition'];
      option['containers'] = ['MP4'];
      createMyPlayer();
    }

    /* Get Video Thumbnail */
    var imdbVideoThumb;

    /* Get Video Title */
    var imdbVideoTitle = getMyContent(page.url, 'meta\\s+property="og:title"\\s+content="(.*?)"', false);
    if (imdbVideoTitle) {
      imdbVideoTitle = imdbVideoTitle.replace(/&quot;/g, '\'').replace(/&#34;/g, '\'').replace(/"/g, '\'');
      imdbVideoTitle = imdbVideoTitle.replace(/&#39;/g, '\'').replace(/'/g, '\'');
      imdbVideoTitle = imdbVideoTitle.replace(/&amp;/g, 'and').replace(/&/g, 'and');
      imdbVideoTitle = imdbVideoTitle.replace(/\?/g, '').replace(/[#:\*]/g, '-').replace(/\//g, '-');
      imdbVideoTitle = imdbVideoTitle.replace(/^\s+|\s+$/, '').replace(/\.+$/g, '');
    }

    /* Get Video Id */
    var imdbVideoId = page.url.replace(/.*videoplayer\//, '').replace(/(\/|\?).*/, '');

    /* Get Videos Content */
    var imdbVideosContent = getMyContent(page.url, '"' + imdbVideoId + '":\\{("aggregateUpVotes.*?videoId)', false);

    /* Get Videos */
    var imdbVideoList = {};
    if (imdbVideosContent) {
      var imdbVideoFormats = {'1080p': 'Full High Definition MP4', '720p': 'High Definition MP4', '480p': 'Standard Definition MP4', '360p': 'Low Definition MP4', 'SD': 'Low Definition MP4', '240p': 'Very Low Definition MP4'};
      var imdbVideoFound = false;
      var imdbVideoParser, imdbVideoParse, myVideoCode, imdbVideo;
      for (var imdbVideoCode in imdbVideoFormats) {
	imdbVideoParser = '"definition":"' + imdbVideoCode + '".*?"videoUrl":"(.*?)"';
	imdbVideoParse = imdbVideosContent.match(imdbVideoParser);
	imdbVideo = (imdbVideoParse) ? imdbVideoParse[1] : null;
	if (imdbVideo) {
	  imdbVideo = cleanMyContent(imdbVideo, false);
	  if (!imdbVideoFound) imdbVideoFound = true;
	  myVideoCode = imdbVideoFormats[imdbVideoCode];
	  if (!imdbVideoList[myVideoCode]) imdbVideoList[myVideoCode] = imdbVideo;
	}
      }

      if (imdbVideoFound) {
	imdbVideosReady = true;
	imdbVideoThumb = imdbVideosContent.match(/"slate".*?"url":"(.*?)"/);
	imdbVideoThumb = (imdbVideoThumb) ? imdbVideoThumb[1] : null;
	if (imdbVideoThumb) imdbVideoThumb = cleanMyContent(imdbVideoThumb, false);
	if (imdbPlayerWindow) imdbPlayer();
      }
      else {
	showMyMessage('!videos');
      }
    }
    else {
      imdbVideo = getMyContent(page.url, '"videoUrl":"(.*?)"', false);
      if (imdbVideo) {
	imdbVideo = cleanMyContent(imdbVideo, false);
	imdbVideoList[imdbDefaultVideo] = imdbVideo;
	imdbVideosReady = true;
	imdbVideoThumb = getMyContent(page.url, '"slate":"(.*?)"', false);
	if (imdbVideoThumb) imdbVideoThumb = cleanMyContent(imdbVideoThumb, false);
	if (imdbPlayerWindow) imdbPlayer();
      }
      else {
	showMyMessage('!content');
      }
    }

  }

}


// ==========Run========== //

ViewTube();

page.win.setInterval(function() {
  if (page.url != page.win.location.href) {
    for (var i = 0; i < intervals.length; i++){
      clearInterval(intervals[i]);
    }
    intervals = [];
    if (player['playerWindow'] && player['playerWindow'].parentNode) {
      removeMyElement(player['playerWindow'].parentNode, player['playerWindow']);
    }
    page.doc = page.win.document;
    page.body = page.doc.body;
    page.url = page.win.location.href;
    blockInterval = 50;
    if (player['playerSocket']) blockObject = player['playerSocket'];
    blockVideos();
    ViewTube();
  }
  // Block videos
  if (blockObject && blockInterval > 0) {
    blockVideos();
    if (blockInterval > 0) blockInterval--;
  }
}, 500);


})();
