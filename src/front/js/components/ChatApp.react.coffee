React = require 'react'
Header = require './Header.react.coffee'

ChatApp = React.createClass
  render: ->
  	return (
      <div>
        <Header />
      </div>
  	)

module.exports = ChatApp
