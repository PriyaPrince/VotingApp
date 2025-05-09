package com.voting;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/VoteServlet")
public class VoteServlet extends HttpServlet {
    private static final Map<String, Integer> voteCount = new HashMap<>();

    static {
        voteCount.put("Breaking Bad", 0);
        voteCount.put("Game of Thrones", 0);
        voteCount.put("Stranger Things", 0);
        voteCount.put("Friends", 0);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedSeries = request.getParameter("series");

        if (selectedSeries != null && voteCount.containsKey(selectedSeries)) {
            voteCount.put(selectedSeries, voteCount.get(selectedSeries) + 1);
        }

        // Pass each vote count separately to results.jsp
        request.setAttribute("breakingBadVotes", voteCount.get("Breaking Bad"));
        request.setAttribute("gameOfThronesVotes", voteCount.get("Game of Thrones"));
        request.setAttribute("strangerThingsVotes", voteCount.get("Stranger Things"));
        request.setAttribute("friendsVotes", voteCount.get("Friends"));

        request.getRequestDispatcher("results.jsp").forward(request, response);
    }
}
