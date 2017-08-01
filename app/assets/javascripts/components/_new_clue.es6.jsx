class NewClue extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      title: '',
      description: '',
      task_type: '',
      order: ''
    }
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick() {
    console.log(this)
    let title       = this.state.title
    let description = this.state.description
    let task_type   = this.state.task_type
    let order       = this.state.order
    $.ajax({
      url: '/api/v1/clues',
      type: 'POST',
      data: { clue: { title: title,
                      description: description,
                      task_type: task_type,
                      order: order
                    }
            },
      success: (clue => this.props.handleSubmit(clue))
    }).fail(function() {
      alert('Your clue did not save! Try again!')
    })
    this.setState({ title: '',
                    description: '',
                    task_type: '',
                    order: order
                  })
  }

  render() {
    return (
      <div>
        <label>Clue title: <input type='text' onChange={(e) => this.setState({title: e.target.value })} value={this.state.title} /></label><br />

        <label>Clue description: <input type='textarea' onChange={(e) => this.setState({description: e.target.value })} value={this.state.description} /></label><br />

        <label>What kind of clue is this?
        <select onChange={(e) => this.setState({task_type: e.target.value })} value={this.state.task_type}>
          <option value="photo">Photo challenge</option>
          <option value="trivia">Trivia challenge</option>
          <option value="video">Video challenge</option>
          <option value="other">Other</option>
        </select></label><br />

        <label>Clue order: <input type='number' onChange={(e) => this.setState({order: e.target.value })} value={this.state.order} /></label><br />

      <button onClick={this.handleClick}>Add Clue</button>
      </div>
    )
  }
}
