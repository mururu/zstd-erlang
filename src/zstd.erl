-module(zstd).

-export([compress/1, compress/2]).
-export([decompress/1]).

-on_load(init/0).

-define(APPNAME, zstd).
-define(LIBNAME, zstd_nif).

-spec compress(Uncompressed :: binary()) -> Compressed :: binary().
compress(Binary) ->
    compress(Binary, 1).

-spec compress(Uncompressed :: binary(), CompressionLevel :: 0..22) -> Compressed :: binary().
compress(_, _) ->
    erlang:nif_error(?LINE).

-spec decompress(Compressed :: binary()) -> Uncompressed :: binary() | error.
decompress(_) ->
    erlang:nif_error(?LINE).

init() ->
    SoName = case code:priv_dir(?APPNAME) of
        {error, bad_name} ->
            case filelib:is_dir(filename:join(["..", priv])) of
                true ->
                    filename:join(["..", priv, ?LIBNAME]);
                _ ->
                    filename:join([priv, ?LIBNAME])
            end;
        Dir ->
            filename:join(Dir, ?LIBNAME)
    end,
    erlang:load_nif(SoName, 0).
