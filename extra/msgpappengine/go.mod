module github.com/vmihailenco/msgpack/extra/appengine

go 1.15

replace go.oneofone.dev/msgpack/v5 => ../..

require (
	go.oneofone.dev/msgpack/v5 v5.3.5
	google.golang.org/appengine v1.6.7
)
