import React, { useState, useEffect } from "react";
import algoliasearch from "algoliasearch";

const client = algoliasearch("R04Q9MFDV2", "888edc033a81cc4cc468da7685298022");
const index = client.initIndex("Post");

function SearchBox(_props) {
  const [query, setQuery] = useState('')

  useEffect(() => {
    const filters = 'tags:1 AND tags:2'
    index
      .search(query, {
        filters,
        attributesToRetrieve: ["id", "title", "tags"],
        hitsPerPage: 50
      })
      .then(res => {
        console.log(res)
        // console.log(res.hits);
      });
  })

  // console.log(query)
  return (
    <input type="text" onChange={e => { setQuery(e.target.value) }} value={query} />
  );
}

export default SearchBox;
