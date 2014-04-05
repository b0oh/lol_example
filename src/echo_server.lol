(defn start () (listen 1234))

(defn- listen (port)
  (let ({'ok socket} (gen_tcp:listen port [{'packet 0} {'active 'false}]))
    (accept socket)))

(defn- accept (listen-socket)
  (let ({'ok socket} (gen_tcp:accept listen-socket))
    (do
      (spawn (lambda () (echo socket)))
      (accept listen-socket))))

(defn- echo (socket)
  (case (gen_tcp:recv socket 0)
    ({'ok data} (do
                  (gen_tcp:send socket data)
                  (echo socket)))
    ({'error 'closed} 'ok)))
