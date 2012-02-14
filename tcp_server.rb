class WmiiTCPNotify
  require 'wmiirc/loader'
  require 'socket'

  attr_accessor :message

  def initialize( port )
    @descriptors = Array::new
    @serverSocket = TCPServer.new( port )
    @serverSocket.setsockopt( Socket::SOL_SOCKET, Socket::SO_REUSEADDR, 1 )
    printf("Wmiirc notify server started on port %d\n", port)
    @descriptors.push( @serverSocket )
  end

  def run
    warn "Server started!"
    loop {
      res = select( @descriptors, nil, nil, nil )
      if res
        res[0].each { |sock|
          if sock == @serverSocket
            accept_new_connection
          else
            if sock.eof?
              str = sprintf("Client left %s:%s\n",
                    sock.peeraddr[2], sock.peeraddr[1])
              broadcast_string( str, sock )
              sock.close
              @descriptors.delete(sock)
            else
              @message = sock.gets()
              str = sprintf("[%s|%s]: %s",
                    sock.peeraddr[2], sock.peeraddr[1], @message)
              broadcast_string(str, sock)
            end
          end
        }
      end
    }
  end

  private

  def broadcast_string str, omit_sock
    @descriptors.each { |clisock|
      if clisock != @serverSocket && clisock != omit_sock
        clisock.write(str)
        Wmiirc::Loader.refresh # is this really refreshing?
      end
    }
    print(str)
  end

  def accept_new_connection
    newsock = @serverSocket.accept
    @descriptors.push( newsock )
    newsock.write("Connected to the Wmiirc TCP Notifier \n")
    str = sprintf("Client joined %s:%s\n",
          newsock.peeraddr[2], newsock.peeraddr[1])
    broadcast_string( str, newsock )
  end
end
