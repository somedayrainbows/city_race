class Clue extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      id: this.props.clue.id,
      editable: false,
      title: this.props.clue.title,
      description: this.props.clue.description,
      task_type: this.props.clue.task_type,
      order: this.props.clue.order
    }
    this.handleEdit = this.handleEdit.bind(this)
  }

  handleEdit() {
    if(this.state.editable) {
      let id          = this.state.id
      let title       = this.state.title
      let description = this.state.description
      let task_type   = this.state.task_type
      let order       = this.state.order
      let clue        = {id, title, description, task_type, order}
      this.props.handleUpdate(clue)
    }
    this.setState({ editable: !this.state.editable })
  }

  render() {
    let title = this.state.editable ?
    <input type='text' onChange={(e) => this.setState({ title: e.target.value })} value={this.state.title} /> :
    <h4>{this.state.title}</h4>

    let description = this.state.editable ?
    <input type='textarea' onChange={(e) => this.setState({ description: e.target.value })} value={this.state.description} /> :
    <h4>{this.state.description}</h4>

    let task_type = this.state.editable ?
    <input type='text' onChange={(e) => this.setState({ task_type: e.target.value })} value={this.state.task_type} /> :
    <h4>{this.state.task_type}</h4>

    let order = this.state.editable ?
    <input type='number' onChange={(e) => this.setState({ order: e.target.value })} value={this.state.order} /> :
    <h4>{this.state.order}</h4>

    return (
      <div className="card card-block">
        <div className="card-title">{title}</div>
        <div className="card-text">{description}</div>
      <div className="card-text"><small className="text-muted">This clue is a <b>{task_type}</b></small><br />
        Clue #{order}</div>
      </div>
    )
  }
}
