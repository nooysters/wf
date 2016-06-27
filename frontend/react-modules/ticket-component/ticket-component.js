import React from 'react'
import { render } from 'react-dom'

//import styles from 'ticket-component.css'

const Ticket = React.createClass({
  render: function() {
    return <div class="ticket">{this.props.title}</div>
  }
});

const TicketList = React.createClass({
  render: function() {
    var ticketNodes = this.props.data.map(function(ticket) {console.log(ticket)
      return (
        <Ticket key={ticket.id} title={ticket.attributes.title}></Ticket>
      )
    });

    return(<div class="ticketList">{ticketNodes}</div>)
  }
});

const TicketBox = React.createClass({
  getInitialState: function() {
    return {data: []};
  },
  loadCommentsFromServer: function() {
    var $this=this
    fetch(this.props.url)
    .then(function(response){
      return response.json()
    }).
    then(function(json) {
      $this.setState({data: json.data});
    });
  },
  componentDidMount: function() {
     this.loadCommentsFromServer();
  },
  render: function() {
    return (
      <div className="ticketBox" >
        <TicketList data={this.state.data} />
      </div>
    )
  }
});

render(<TicketBox url="/tickets.json"/>, document.getElementById('ticket-box'));
