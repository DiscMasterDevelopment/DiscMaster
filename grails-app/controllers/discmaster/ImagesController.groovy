package discmaster

class ImagesController {

    def get() {
        if(params.containsKey('id')) {
            Image img = Image.get(params.id)

            byte[] image = img.image
            response.contentType = img.type
            response.contentLength = img.image.size()

            OutputStream out = response.outputStream
            out.write(image)
            out.close()
        }
    }
}
