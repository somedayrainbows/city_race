var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

var _get = function get(_x, _x2, _x3) { var _again = true; _function: while (_again) { var object = _x, property = _x2, receiver = _x3; _again = false; if (object === null) object = Function.prototype; var desc = Object.getOwnPropertyDescriptor(object, property); if (desc === undefined) { var parent = Object.getPrototypeOf(object); if (parent === null) { return undefined; } else { _x = parent; _x2 = property; _x3 = receiver; _again = true; desc = parent = undefined; continue _function; } } else if ('value' in desc) { return desc.value; } else { var getter = desc.get; if (getter === undefined) { return undefined; } return getter.call(receiver); } } };

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

function _inherits(subClass, superClass) { if (typeof superClass !== 'function' && superClass !== null) { throw new TypeError('Super expression must either be null or a function, not ' + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var Clue = (function (_React$Component) {
  _inherits(Clue, _React$Component);

  function Clue(props) {
    _classCallCheck(this, Clue);

    _get(Object.getPrototypeOf(Clue.prototype), 'constructor', this).call(this, props);

    this.state = {
      id: this.props.clue.id,
      editable: false,
      title: this.props.clue.title,
      description: this.props.clue.description,
      task_type: this.props.clue.task_type,
      order: this.props.clue.order
    };
    this.handleEdit = this.handleEdit.bind(this);
  }

  _createClass(Clue, [{
    key: 'handleEdit',
    value: function handleEdit() {
      if (this.state.editable) {
        var id = this.state.id;
        var title = this.state.title;
        var description = this.state.description;
        var task_type = this.state.task_type;
        var order = this.state.order;
        var clue = { id: id, title: title, description: description, task_type: task_type, order: order };
        this.props.handleUpdate(clue);
      }
      this.setState({ editable: !this.state.editable });
    }
  }, {
    key: 'render',
    value: function render() {
      var _this = this;

      var title = this.state.editable ? React.createElement('input', { type: 'text', onChange: function (e) {
          return _this.setState({ title: e.target.value });
        }, value: this.state.title }) : React.createElement(
        'h4',
        null,
        this.state.title
      );

      var description = this.state.editable ? React.createElement('input', { type: 'textarea', onChange: function (e) {
          return _this.setState({ description: e.target.value });
        }, value: this.state.description }) : React.createElement(
        'h4',
        null,
        this.state.description
      );

      var task_type = this.state.editable ? React.createElement('input', { type: 'text', onChange: function (e) {
          return _this.setState({ task_type: e.target.value });
        }, value: this.state.task_type }) : React.createElement(
        'h4',
        null,
        this.state.task_type
      );

      var order = this.state.editable ? React.createElement('input', { type: 'number', onChange: function (e) {
          return _this.setState({ order: e.target.value });
        }, value: this.state.order }) : React.createElement(
        'h4',
        null,
        this.state.order
      );

      return React.createElement(
        'div',
        { className: 'card card-block' },
        React.createElement(
          'div',
          { className: 'card-title' },
          title
        ),
        React.createElement(
          'div',
          { className: 'card-text' },
          description
        ),
        React.createElement(
          'div',
          { className: 'card-text' },
          React.createElement(
            'small',
            { className: 'text-muted' },
            'This clue is a ',
            React.createElement(
              'b',
              null,
              task_type
            )
          ),
          React.createElement('br', null),
          'Clue #',
          order
        )
      );
    }
  }]);

  return Clue;
})(React.Component);