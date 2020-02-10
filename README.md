### Visual C++ in Docker

Kind of almost minimum Docker container with MSVC++ minimal components built in, to compile a helloworld with both MSBuild and CMake.
About 9GB image and ~30 minutes to build for first run :/

To build:

`docker build -t minsample .` 

And go boil about 6 eggs, but in sequence.

To run:

`docker run --rm minsample`
