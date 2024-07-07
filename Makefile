CUDA       = /usr/local/cuda-12.1
CXXCUDA    = /usr/bin/g++
CXXFLAGS   = -mssse3 -msse4.1

all:
		nvcc -o libsecp256k1.so --shared SECP256K1.cpp Int.cpp IntMod.cpp Random.cpp Point.cpp \
		GPU/GPUEngine.cu \
		hash/ripemd160_sse.cpp hash/ripemd160.cpp hash/sha256.cpp hash/sha512.cpp hash/sha256_sse.cpp \
		Base58.cpp Bech32.cpp IntGroup.cpp Timer.cpp Kanga.cu shanidev.cu \
		-I$(CUDA)/include -L$(CUDA)/lib64 -lcudart -Xcompiler "$(CXXFLAGS) -fPIC" \
		-lsecp256k1

clean:
	rm -f libsecp256k1.so
	rm -f *.o
