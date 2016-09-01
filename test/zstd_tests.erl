-module(zstd_tests).

-include_lib("eunit/include/eunit.hrl").

zstd_test() ->
  Data = <<"Hello, World!">>,
  ?assertEqual(Data, zstd:decompress(zstd:compress(Data))).
