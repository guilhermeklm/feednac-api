package senac.feednac.application.response;

import java.util.ArrayList;
import java.util.List;

public class ApiErrorResponse extends ApiResponse {

    private List<String> messages;

    public ApiErrorResponse(int statusCode) {
        super(statusCode);
        this.messages = new ArrayList<>();
    }

    public ApiErrorResponse(int statusCode, List<String> messages) {
        super(statusCode);
        this.messages = messages;
    }

    public void addErrorMessage(String message) {
        this.messages.add(message);
    }

    public List<String> getMessages() {
        return messages;
    }
}
