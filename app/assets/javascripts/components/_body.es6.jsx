class Body extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      clues: []
    }
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleDelete = this.handleDelete.bind(this)
    this.handleUpdate = this.handleUpdate.bind(this)
    this.updateClues = this.updateClues.bind(this)
  }

  componentDidMount() {
    $.getJSON('/api/v1/clues', clues => this.setState({ clues }))
  }

  handleSubmit(clue) {
    let newState = this.state.clues.concat(clue)
    this.setState({ clues: newState })
  }

  handleDelete(id) {
    $.ajax({
      url: `/api/v1/clues/${id}`,
      type: 'DELETE',
      success: (() => this.removeClue(id)),
    })
  }

  removeClue(id) {
    let newClues = this.state.clues.filter(clue => clue.id != id)
    this.setState({ clues: newClues})
  }

  handleUpdate(clue) {
    $.ajax({
      url: `/api/v1/clues/${clue.id}`,
      type: 'PUT',
      data: { clue },
      success: (() => this.updateClues(clue)),
    })
  }

  updateClues(clue) {
    let clues = this.state.clues.filter(i => i.id != clue.id )
    clues.push(clue)
    this.setState({clues: clues})
  }

  render() {
      return (
        <div>
          <div className="container">
            <div className="row">
              <NewClue handleSubmit={this.handleSubmit} />
              <br />
              <div className="card-columns">
                <AllClues
                  clues={this.state.clues}
                  handleDelete={this.handleDelete}
                  handleUpdate={this.handleUpdate}
                />
            </div>
          </div>
        </div>
      </div>
      )
    }
  }
