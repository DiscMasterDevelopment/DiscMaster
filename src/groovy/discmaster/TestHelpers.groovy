package discmaster

class TestHelpers {
    static Map<String, Object> removeAField(fields, String fieldToRemove) {
        def fs = (Map<String, Object>) fields.clone()
        fs.remove(fieldToRemove)
        return fs
    }
}
