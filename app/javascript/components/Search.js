import React, { Component } from "react";

class Search extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const searchResults = this.props.searchResults.map(currency => (
      <li
        key={currency.id}
        className="currency-list-item"
        data-id={currency.id}
      >
        <a href="#" className="currency">
          {" "}
          <span> {currency.name} </span>
          <span> {currency.currency_symbol} </span>
        </a>
      </li>
    ));
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
          <div className="currency-list">{searchResults}</div>
        </form>
      </div>
    );
  }
}

export default Search;
