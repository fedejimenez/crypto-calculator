import React, { Component } from "react";

class Search extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>Cryptocurrency Portfolio Calculator</h1>
        <form>
          <div className="form-group">
            <label>Search for a Currency:</label>
            <br />
            <input
              className="field"
              autoComplete="off"
              type="text"
              name="name"
              placeholder="Ex: Bitcoin, Ethereum..."
              value={this.props.name}
              onChange={this.props.handleChange}
            />
          </div>
        </form>
      </div>
    );
  }
}

export default Search;
