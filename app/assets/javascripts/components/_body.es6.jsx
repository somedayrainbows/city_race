class Body extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      clues: []
    }
  }

  componentDidMount() {
    $.getJSON('/api/v1/clues', clues => this.setState({ clues }))
  }

  render() {
    return (
      <div>
        <div className="jumbotron">
          <NewClue />
          <br />
          <div className="row">
            <div className="col-md-4">
              <AllClues clues={this.state.clues} />
            </div>
          </div>
        </div>
      </div>
    )
  }
}
