# go-snippets package (Not ready for prime)

Go Language Snippets for Atom

## Usage ##

All snippets start with `g-` prefix

### Error Snippets

`g-err-return`

```go
if err != nil {
  return $1 err
}
```

### Assert Snippets

`g-assert-noerror`
```go
assert.NoError(t, err)
```
`g-assert-notnil`

```go
assert.NotNil(t,$1)
```

### Test Snippets
`g-test-cases`

```go

// Test$1 $2
func Test$1(t *testing.T) {

	testCases := []struct {
		given    string
		expected string
	}{
		{
			given:    "",
			expected: "",
		},
	}

	for _, tc := range testCases {

	}

}

```
### Import Snippets
`g-im-boltdb`
```go
${1:import} "github.com/boltdb/bolt"
```
