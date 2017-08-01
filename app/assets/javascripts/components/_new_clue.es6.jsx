class NewClue extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      title: '',
      description: '',
      task_type: '',
      order: '',
      hunt_id: window.location.pathname.split('/')[2]
    }
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick() {
    console.log(this)
    console.log(window.location.pathname.split('/')[2])
    let title       = this.state.title
    let description = this.state.description
    let task_type   = this.state.task_type
    let order       = this.state.order
    let hunt_id     = this.state.hunt_id
    console.log(title)
    console.log(description)
    console.log(task_type)
    console.log(order)
    console.log(hunt_id)
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
        <label>Clue title: <input type='text' placeholder='title' onChange={(e) => this.setState({title: e.target.value })} value={this.state.title} /></label><br />

        <label>Clue description: <input type='textarea' placeholder='description' cols="50" rows="10" onChange={(e) => this.setState({description: e.target.value })} value={this.state.description} /></label><br />

        <label>Is this a photo, trivia, video, or other challenge? <input type='text' placeholder='challenge type' onChange={(e) => this.setState({task_type: e.target.value })} value={this.state.task_type} /></label><br />

        <label>Clue order: <input type='number' placeholder='order' onChange={(e) => this.setState({order: e.target.value })} value={this.state.order} /></label><br />

        <input type='hidden' value={this.state.hunt_id} />

      <button onClick={this.handleClick}>Add Clue</button>
      </div>
    )
  }
}
