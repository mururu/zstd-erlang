-module(zstd_tests).

-include_lib("eunit/include/eunit.hrl").

zstd_test() ->
  Data = <<"Hello, World!">>,
  ?assertEqual(Data, zstd:decompress(zstd:compress(Data))).

zstd_iodata_test() ->
  Data = ["Hello", ", World!"],
  Expected = <<"Hello, World!">>,
  ?assertEqual(Expected, zstd:decompress(zstd:compress(Data))).
