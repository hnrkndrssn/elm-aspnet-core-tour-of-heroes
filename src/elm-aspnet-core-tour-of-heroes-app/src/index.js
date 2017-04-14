'use strict';

import './index.html';
import './Main.less';

import Elm from './Main.elm';
let mountNode = document.getElementById('main');

var app = Elm.Main.embed(mountNode);