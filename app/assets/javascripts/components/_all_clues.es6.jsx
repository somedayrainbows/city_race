class AllClues extends React.Component {
  constructor(props) {
    super(props)
  }

  handleDelete(id) {
    this.props.handleDelete(id)
  }

  render() {
    let clues = this.props.clues.reverse().map(clue => (
      <div className="col-md-3" className="card" key={clue.id}>
        <Clue
          clue={clue}
          handleDelete={this.handleDelete.bind(this, clue.id)}
          handleUpdate={this.props.handleUpdate} />
      </div>
    ))
    console.log()
  return <div>{clues}</div>
  }
}
