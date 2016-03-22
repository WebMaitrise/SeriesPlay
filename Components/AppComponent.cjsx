@AppComponent = React.createClass
  render: ->


    <div>
      <h2>App Component</h2>
      <AccountBar />
      {this.props.children}
    </div>
