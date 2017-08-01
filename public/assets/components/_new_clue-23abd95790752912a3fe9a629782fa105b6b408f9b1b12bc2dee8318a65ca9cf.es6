var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

var _get = function get(_x, _x2, _x3) { var _again = true; _function: while (_again) { var object = _x, property = _x2, receiver = _x3; _again = false; if (object === null) object = Function.prototype; var desc = Object.getOwnPropertyDescriptor(object, property); if (desc === undefined) { var parent = Object.getPrototypeOf(object); if (parent === null) { return undefined; } else { _x = parent; _x2 = property; _x3 = receiver; _again = true; desc = parent = undefined; continue _function; } } else if ('value' in desc) { return desc.value; } else { var getter = desc.get; if (getter === undefined) { return undefined; } return getter.call(receiver); } } };

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

function _inherits(subClass, superClass) { if (typeof superClass !== 'function' && superClass !== null) { throw new TypeError('Super expression must either be null or a function, not ' + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var NewClue = (function (_React$Component) {
  _inherits(NewClue, _React$Component);

  function NewClue(props) {
    _classCallCheck(this, NewClue);

    _get(Object.getPrototypeOf(NewClue.prototype), 'constructor', this).call(this, props);

    this.state = {
      title: '',
      description: '',
      task_type: '',
      order: '',
      hunt_id: window.location.pathname.split('/')[2]
    };
    this.handleClick = this.handleClick.bind(this);
  }

  _createClass(NewClue, [{
    key: 'handleClick',
    value: function handleClick() {
      var _this = this;

      console.log(this);
      console.log(window.location.pathname.split('/')[2]);
      var title = this.state.title;
      var description = this.state.description;
      var task_type = this.state.task_type;
      var order = this.state.order;
      var hunt_id = this.state.hunt_id;
      console.log(title);
      console.log(description);
      console.log(task_type);
      console.log(order);
      console.log(hunt_id);
      $.ajax({
        url: '/api/v1/clues',
        type: 'POST',
        data: { clue: { title: title,
            description: description,
            task_type: task_type,
            order: order,
            hunt_id: hunt_id
          }
        },
        success: function (clue) {
          return _this.props.handleSubmit(clue);
        }
      }).fail(function () {
        alert('Your clue did not save! Try again!');
      });
      this.setState({ title: '',
        description: '',
        task_type: '',
        order: order
      });
    }
  }, {
    key: 'render',
    value: function render() {
      var _this2 = this;

      return React.createElement(
        'div',
        null,
        React.createElement(
          'label',
          null,
          'Clue title: ',
          React.createElement('input', { type: 'text', placeholder: 'title', onChange: function (e) {
              return _this2.setState({ title: e.target.value });
            }, value: this.state.title })
        ),
        React.createElement('br', null),
        React.createElement(
          'label',
          null,
          'Clue description: ',
          React.createElement('input', { type: 'textarea', placeholder: 'description', cols: '50', rows: '10', onChange: function (e) {
              return _this2.setState({ description: e.target.value });
            }, value: this.state.description })
        ),
        React.createElement('br', null),
        React.createElement(
          'label',
          null,
          'Is this a photo, trivia, video, or other challenge? ',
          React.createElement('input', { type: 'text', placeholder: 'challenge type', onChange: function (e) {
              return _this2.setState({ task_type: e.target.value });
            }, value: this.state.task_type })
        ),
        React.createElement('br', null),
        React.createElement(
          'label',
          null,
          'Clue order: ',
          React.createElement('input', { type: 'number', placeholder: 'order', onChange: function (e) {
              return _this2.setState({ order: e.target.value });
            }, value: this.state.order })
        ),
        React.createElement('br', null),
        React.createElement('input', { type: 'hidden', value: this.state.hunt_id }),
        React.createElement(
          'button',
          { onClick: this.handleClick },
          'Add Clue'
        )
      );
    }
  }]);

  return NewClue;
})(React.Component);