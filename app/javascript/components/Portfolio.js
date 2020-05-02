import React, { Component } from "react";

class Portfolio extends Component {
  constructor(props) {
    super(psops);
    this.state = {
      someKey: "someValue"
    };
  }

  render() {
    return <p>Calculate goes here</p>;
  }

  componentDidMount() {
    this.setState({
      someKey: "otherValue"
    });
  }
}

export default Portfolio;
