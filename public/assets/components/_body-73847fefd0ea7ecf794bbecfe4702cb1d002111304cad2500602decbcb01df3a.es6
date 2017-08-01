var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

var _get = function get(_x, _x2, _x3) { var _again = true; _function: while (_again) { var object = _x, property = _x2, receiver = _x3; _again = false; if (object === null) object = Function.prototype; var desc = Object.getOwnPropertyDescriptor(object, property); if (desc === undefined) { var parent = Object.getPrototypeOf(object); if (parent === null) { return undefined; } else { _x = parent; _x2 = property; _x3 = receiver; _again = true; desc = parent = undefined; continue _function; } } else if ('value' in desc) { return desc.value; } else { var getter = desc.get; if (getter === undefined) { return undefined; } return getter.call(receiver); } } };

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

function _inherits(subClass, superClass) { if (typeof superClass !== 'function' && superClass !== null) { throw new TypeError('Super expression must either be null or a function, not ' + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var Body = (function (_React$Component) {
  _inherits(Body, _React$Component);

  function Body(props) {
    _classCallCheck(this, Body);

    _get(Object.getPrototypeOf(Body.prototype), 'constructor', this).call(this, props);

    this.state = {
      clues: []
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
    this.handleUpdate = this.handleUpdate.bind(this);
    this.updateClues = this.updateClues.bind(this);
  }

  _createClass(Body, [{
    key: 'componentDidMount',
    value: function componentDidMount() {
      var _this = this;

      $.getJSON('/api/v1/clues', function (clues) {
        return _this.setState({ clues: clues });
      });
    }
  }, {
    key: 'handleSubmit',
    value: function handleSubmit(clue) {
      var newState = this.state.clues.concat(clue);
      this.setState({ clues: newState });
    }
  }, {
    key: 'handleDelete',
    value: function handleDelete(id) {
      var _this2 = this;

      $.ajax({
        url: '/api/v1/clues/' + id,
        type: 'DELETE',
        success: function () {
          return _this2.removeClue(id);
        }
      });
    }
  }, {
    key: 'removeClue',
    value: function removeClue(id) {
      var newClues = this.state.clues.filter(function (clue) {
        return clue.id != id;
      });
      this.setState({ clues: newClues });
    }
  }, {
    key: 'handleUpdate',
    value: function handleUpdate(clue) {
      var _this3 = this;

      $.ajax({
        url: '/api/v1/clues/' + clue.id,
        type: 'PUT',
        data: { clue: clue },
        success: function () {
          return _this3.updateClues(clue);
        }
      });
    }
  }, {
    key: 'updateClues',
    value: function updateClues(clue) {
      var clues = this.state.clues.filter(function (i) {
        return i.id != clue.id;
      });
      clues.push(clue);
      this.setState({ clues: clues });
    }
  }, {
    key: 'render',
    value: function render() {
      return React.createElement(
        'div',
        null,
        React.createElement(
          'div',
          { className: 'container' },
          React.createElement(
            'div',
            { className: 'row' },
            React.createElement(NewClue, { handleSubmit: this.handleSubmit }),
            React.createElement('br', null),
            React.createElement(
              'div',
              { className: 'card-columns' },
              React.createElement(AllClues, {
                clues: this.state.clues,
                handleDelete: this.handleDelete,
                handleUpdate: this.handleUpdate
              })
            )
          )
        )
      );
    }
  }]);

  return Body;
})(React.Component);