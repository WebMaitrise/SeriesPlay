@AppComponent = React.createClass
  render: ->
    <div>
      <h2>App Component</h2>
      {this.props.children}
    </div>
